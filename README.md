# theia-python:aicots with nginx reverse proxy

## Build and Run
```
docker-compose up --build
```

## Open

http://{your_local_lan_ip}:8080 or

https://{your_local_lan_ip}:8443

# for theia-python:aicots only

## Build and Run
```
bash build.sh
docker run --rm -it -p 3000:3000 theia-python:aicots
```

## Open

http://127.0.0.1:3000
