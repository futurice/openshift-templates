# s2i-clojure

This is an S2I builder image to create and run Clojure uberjars. This image
supports incremental builds by caching the Maven repository.

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
s2i build test/test-app s2i-clojure s2i-clojure-app
---> Building and installing application from source...
```

### Build the Image incrementally

```
s2i build --incremental=true test/test-app s2i-clojure s2i-clojure-app
---> Restoring build artifacts...
---> Building and installing application from source...
```

### Run the Image

```
docker run -d -p 8080:8080 s2i-clojure-app
```
