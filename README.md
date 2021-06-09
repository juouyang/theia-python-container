# theia-python with nginx reverse proxy

https://drive.google.com/file/d/13JaBX5NRyG7zzX2ajtHPEhRaFJYPHNMO/view?usp=sharing

## Build and Run
```
bash build.sh
docker run --rm -it -p 8443:443 theia-python:aicots
```

## Open

https://localhost:8443


---

## To create crt and key with your own CA

Refer proxy/ssl/README.md


---

## Import CA in windows

Start certlm.msc (the certificates management console for local machine) and import the root CA certificate (proxy/ssl/myCA.pem) in the Registry physical store. (https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/valid-root-ca-certificates-untrusted#examples-of-alternative-methods-for-publishing-root-ca-certificates)


---

## Modify extensions

### Python

```
"vscode-python": "https://open-vsx.org/api/ms-python/python/2020.10.332292344/file/ms-python.python-2020.10.332292344.vsix",
```

Source: https://open-vsx.org/extension/ms-python/python


### Image Preview

```
"vscode-builtin-image-preview": "https://open-vsx.org/api/vscode/image-preview/1.57.0-next.cdf318e1e21/file/vscode.image-preview-1.57.0-next.cdf318e1e21.vsix"
```

Source: https://open-vsx.org/extension/vscode/image-preview/1.57.0-next.cdf318e1e21
