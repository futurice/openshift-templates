## nginx-basic-auth

This is a sidecar image to be run in [OpenShift][openshift] which will provide
an [nginx][nginx] reverse proxy with HTTP basic authentication.

[openshift]: https://openshift.com
[nginx]: https://www.nginx.com

### Setup

Build the image locally and push it to the OpenShift registry:

```
$ oc login https://console.pro-eu-west-1.openshift.com
$ docker login -u `oc whoami` -p `oc whoami -t` registry.pro-eu-west-1.openshift.com
$ docker build -t registry.pro-eu-west-1.openshift.com/project/nginx-sidecar-basic-auth .
$ docker push registry.pro-eu-west-1.openshift.com/project/nginx-sidecar-basic-auth
```

### Usage

Add the sidecar container next to your application container in your deployment
configuration:

```yaml
- image: docker-registry.default.svc:5000/project/nginx-sidecar-basic-auth
  imagePullPolicy: Always
  name: auth-proxy
  ports:
    - containerPort: 8087
      protocol: TCP
  env:
    - name: FORWARD_PORT
      value: ${CONTAINER_PORT}
```

### Environment

- `PORT`: the proxy port (default: `8087`)
- `FORWARD_PORT`: the application port (default: `8080`)
- `HTPASSWD`: inline `.htpasswd` file for authentication (default credentials: `admin`/`admin`)
