# theia-python:aicots with nginx reverse proxy

## Build and Run
```
bash build.sh
docker run --rm -it -p 8443:443 theia-python:aicots
```

## Open

https://localhost:8443

https://pve.dev.net:8443

https://192.168.233.136:8443


---

## To create crt and key with your own CA

Refer proxy/ssl/README.md

---

## Import CA in windows

Start certlm.msc (the certificates management console for local machine) and import the root CA certificate (proxy/ssl/myCA.pem) in the Registry physical store. (https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/valid-root-ca-certificates-untrusted#examples-of-alternative-methods-for-publishing-root-ca-certificates)
