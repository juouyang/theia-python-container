#!/bin/bash

# set 3.8 as default version
update-alternatives --install /usr/bin/python python /usr/local/bin/python3.8 99

# upgrade pip
python -m pip install --upgrade pip

# install requirements.txt
pip install -r /tmp/requirements.txt

#pip install \
#    python-language-server \
#    flake8 \
#    autopep8 \
#    futures \
#    configparser \
#    kaleido \
#    pylint==2.7.4 \
#    plotly==4.14.3 \
#    jupyter==1.0.0 \
#    shioaji==0.3.1.dev8 \
#    psutil==5.8.0 \
#    getmac==0.8.2