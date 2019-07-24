# s2i-yarn-static

This is an S2I builder image to build static webpages using [yarn][yarn] and
serve them using [nginx][nginx].

[yarn]: https://www.nginx.com/
[nginx]: https://yarnpkg.com/en/

## Expected Source

- `package.json`: Needs to define a `build` alias that creates static output in
  `./build`.
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
s2i build test/test-app s2i-yarn-static s2i-yarn-static-app
---> Building and installing application from source...
```

### Run the Image

```
docker run -d -p 8080:8080 s2i-yarn-static-app
```
