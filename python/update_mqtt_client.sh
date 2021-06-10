rm -rf ${PWD}/Doquant/
mkdir -p ${PWD}/Doquant/
cd ${PWD}/Doquant/
ssh-agent bash -c 'ssh-add ../github_key_doquant; git clone git@github.com:ian15937/mqtt_client.git'