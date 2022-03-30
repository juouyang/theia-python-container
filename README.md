# theia-python with nginx reverse proxy

This is a theia container image for the development of python.
![Screenshot](https://user-images.githubusercontent.com/80164/160885529-e7dab1b0-55cb-414b-a8c7-9c6445fd0e3a.png)

## Build (will cleanup previous containers and images)
```
bash build.sh
```

## Run
```
docker run --rm -it -p 8443:443 theia-python:dev
```

## Rebuild (incremental updates, without cleanup previous images)

```
docker build . -t theia-python:dev --file ./Dockerfile
```

## Test

browse https://localhost:8443

## Test with SSL in Linux

> :warning: **If you are using linux**: Be very careful here!

```
sudo mkdir -p /usr/local/share/ca-certificates/pve.dev.net
sudo chmod 755 /usr/local/share/ca-certificates/pve.dev.net
sudo cp ./proxy/ssl/myCA.pem /usr/local/share/ca-certificates/pve.dev.net/myCA.pem
sudo chmod 644 /usr/local/share/ca-certificates/pve.dev.net/myCA.pem
sudo update-ca-certificates
echo '127.0.0.1 pve.dev.net | sudo tee -a /etc/hosts
```

browse https://pve.dev.net:8443

---

### Features

* Statistic library

   1. NumPy
   2. SciPy
   3. Pandas
   4. Statsmodel
   5. Quandl
   6. Zipline
   7. TA-Lib
   8. Matplotlib

* ML library

   1. Tensorflow
   2. Pytorch
   3. Caffe2

### References

* Upstream Dockerfile: https://github.com/theia-ide/theia-apps/blob/master/theia-python-docker
* Python extension: https://open-vsx.org/extension/ms-python/python
* Image Preview extension: https://open-vsx.org/extension/vscode/image-preview/1.57.0-next.cdf318e1e21

---

## Modifications of $version.package.json

Change
```
"vscode-python": "https://open-vsx.org/api/ms-python/python/2020.10.332292344/file/ms-python.python-2020.10.332292344.vsix",
```

Add
```
"vscode-builtin-image-preview": "https://open-vsx.org/api/vscode/image-preview/1.57.0-next.cdf318e1e21/file/vscode.image-preview-1.57.0-next.cdf318e1e21.vsix"
```
