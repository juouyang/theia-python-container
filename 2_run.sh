docker run \
    -v "/root/Dropbox/builds/eclipse-theia/aicots/theia-python-volume/:/home/project" \
    --rm \
    --name aicots \
    -p 30000:3000 \
    -d \
    aicots:0.1
    #-it --entrypoint=/bin/bash \
docker logs aicots -f
