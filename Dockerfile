FROM theiaide/theia-python:next

ADD extra/requirements.txt /tmp/

RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.8 99 \
    && python -m pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/*

ENV TZ "Asia/Taipei"
#ENV THEIA_WEBVIEW_EXTERNAL_ENDPOINT="{{hostname}}"
