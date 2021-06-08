ARG NODE_VERSION=12.18.3

FROM node:${NODE_VERSION}
ARG version=next
WORKDIR /home/theia
ADD $version.package.json ./package.json
ARG GITHUB_TOKEN
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn theia download:plugins && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean

FROM node:${NODE_VERSION}

# Install Python 3 from source
ARG VERSION=3.8.10

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y make build-essential libssl-dev \
    && apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    && apt-get install -y libncurses5-dev  libncursesw5-dev xz-utils tk-dev \
    && wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz \
    && tar xvf Python-$VERSION.tgz \
    && cd Python-$VERSION \
    && ./configure \
    && make -j8 \
    && make install \
    && cd .. \
    && rm -rf Python-$VERSION \
    && rm Python-$VERSION.tgz

ADD python/requirements.txt /tmp/

RUN apt-get update \
    && apt-get install -y python3-dev python3-pip \
    && pip3 install --upgrade pip \
    && pip3 install python-language-server flake8 autopep8 \
    && apt-get install -y yarn \
    \
    && pip3 install -r /tmp/requirements.txt \
    && apt-get upgrade -yq --no-install-recommends \
                    ca-certificates \
                    openssl \
                    nginx \
                    apache2-utils \
    && update-alternatives --install /usr/bin/python python /usr/local/bin/python3.8 99 \
    \
    && apt-get clean \
    && apt-get auto-remove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

# install TA-lib, http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
COPY python/ta-lib-0.4.0-src.tar.gz /tmp/
RUN tar -xzf /tmp/ta-lib-0.4.0-src.tar.gz -C /tmp \
    && cd /tmp/ta-lib/ \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && pip3 install TA-Lib

# install PyTorch
RUN pip3 install torch==1.8.1+cpu torchvision==0.9.1+cpu torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html

# Config NGINX
COPY proxy/ssl/dev.net.key /etc/nginx/certificates/key.pem
COPY proxy/ssl/dev.net.crt /etc/nginx/certificates/cert.pem
COPY proxy/ssl.conf /etc/nginx/conf.d
COPY proxy/common.conf /etc/nginx
COPY proxy/nginx.conf /etc/nginx

# Expose ports
EXPOSE 443
HEALTHCHECK --interval=300s --timeout=3s CMD curl -fs http://localhost:3000 || exit 1

RUN mkdir -p /home/theia \
    && mkdir -p /home/project
ENV HOME /home/theia
WORKDIR /home/theia
COPY --from=0 /home/theia /home/theia
ENV SHELL=/bin/bash \
    THEIA_DEFAULT_PLUGINS=local-dir:/home/theia/plugins
ENV USE_LOCAL_GIT true

ENV TZ "Asia/Taipei"
ENV THEIA_WEBVIEW_EXTERNAL_ENDPOINT="{{hostname}}"

COPY my_wrapper_script.sh my_wrapper_script.sh
CMD bash
ENTRYPOINT ./my_wrapper_script.sh

# install aicots mqtt_client library
RUN python -m wget https://github.com/juouyang-aicots/py2docker/raw/main/mqtt_client_bb43ef15.tar -o /tmp/mqtt_client.tar \
    && mkdir -p /usr/local/lib/python3.8/site-packages/mqtt_client/ \
    && tar -xf /tmp/mqtt_client.tar -C /usr/local/lib/python3.8/site-packages/mqtt_client/