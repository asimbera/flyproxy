FROM alpine:latest AS builder

WORKDIR /data

RUN apk --no-cache add curl wget && \
  curl -s https://api.github.com/repos/fatedier/frp/releases/latest \
  | grep "https://.*/frp_.*_linux_amd64.tar.gz" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget --quiet --output-document - --input-file - \
  | tar xzv --strip-components=1

FROM scratch

COPY --from=builder /data/frps /
COPY --from=builder /data/frps.ini /

ENTRYPOINT [ "/frps", "-c", "/frps.ini" ]