# s2i-yarn-server

This is an S2I builder image to build and run backend services using
[yarn][yarn].

[yarn]: https://www.nginx.com/

## Expected Source

- `package.json`: Needs to define a `server` alias that starts up the internal
  server.
- `yarn.lock`

## Builder Image

### Build the Image

```
make
```

### Test the Image

```
make test
```

## Application Image

### Build the Image

```
s2i build test/test-app s2i-yarn-server s2i-yarn-server-app
---> Building and installing application from source...
```

### Run the Image

```
docker run -d -p 8080:8080 s2i-yarn-server-app
```
