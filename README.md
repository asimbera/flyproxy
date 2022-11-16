# FlyProxy
Server image for docker based on [fatedier/frp](https://github.com/fatedier/frp).

## Usage
Run docker container with:
```sh
docker run ghcr.io/asimbera/flyproxy:latest
```

To use custom configurations, create a Dockerfile with following content:
```Dockerfile
FROM ghcr.io/asimbera/flyproxy:latest
COPY frps.ini /frps.ini
```

`frps.ini` should be in your current folder.

For configuration reference, see [fatedier/frp](https://github.com/fatedier/frp).