# s2i-yarn-static

This is an S2I builder image to build static webpages using [yarn][yarn] and
serve them using [nginx][nginx].

[yarn]: https://www.nginx.com/
[nginx]: https://yarnpkg.com/en/

## Source Input

This image expects the `package.json` to define an alias `build` that creates a
static output in the subdirectory `./build`.

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
s2i build test/test-app s2i-yarn-static s2i-yarn-static-app
---> Building and installing application from source...
```

### Build the Image incrementally

```
s2i build --incremental=true test/test-app s2i-yarn-static s2i-yarn-static-app
---> Restoring build artifacts...
---> Building and installing application from source...
```

### Run the Image

```
docker run -d -p 8080:8080 s2i-yarn-static-app
```
