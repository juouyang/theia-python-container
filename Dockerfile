FROM theiaide/theia-python:1.11.0-next.c9db9754

ADD extra/requirements.txt /tmp/

RUN apt-get update \
    && apt-get upgrade -yq --no-install-recommends \
            ca-certificates \
            sudo \
    && apt-get clean \
    && apt-get remove --purge --auto-remove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && update-alternatives --install /usr/bin/python python /usr/local/bin/python3.8 99 \
    && python -m pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/*

ENV TZ "Asia/Taipei"
ENV THEIA_WEBVIEW_EXTERNAL_ENDPOINT="{{hostname}}"
