FROM theiaide/theia-python:next

ADD python/requirements.txt /tmp/

RUN apt-get update \
    && apt-get upgrade -yq --no-install-recommends \
            ca-certificates \
            openssl nginx \
    && apt-get clean \
    && apt-get remove --purge --auto-remove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && update-alternatives --install /usr/bin/python python /usr/local/bin/python3.8 99 \
    && python -m pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/*

COPY proxy/ssl/dev.net.key /etc/nginx/certificates/key.pem
COPY proxy/ssl/dev.net.crt /etc/nginx/certificates/cert.pem
COPY proxy/default.conf /etc/nginx/conf.d
COPY proxy/ssl.conf /etc/nginx/conf.d
COPY proxy/common.conf /etc/nginx
COPY proxy/nginx.conf /etc/nginx

# Expose ports
EXPOSE 443

ENV TZ "Asia/Taipei"
ENV THEIA_WEBVIEW_EXTERNAL_ENDPOINT="{{hostname}}"

COPY my_wrapper_script.sh my_wrapper_script.sh
CMD bash
ENTRYPOINT ./my_wrapper_script.sh