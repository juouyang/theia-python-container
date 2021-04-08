FROM theiaide/theia-python:1.11.0-next.c9db9754
#FROM theiaide/theia-python:next

RUN apt-get update \
    && apt-get upgrade -yq --no-install-recommends \
            ca-certificates \
            sudo \
    && apt-get clean \
    && apt-get remove --purge --auto-remove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

COPY project/ /home/project

ADD extra/install_python.sh extra/requirements.txt /tmp/
RUN /bin/bash /tmp/install_python.sh && rm /tmp/install_python.sh && rm /tmp/requirements.txt

ENV TZ "Asia/Taipei"
#RUN echo "Asia/Taipei" > /etc/timezone

ENV THEIA_WEBVIEW_EXTERNAL_ENDPOINT="{{hostname}}"
