FROM alpine:3.20
ARG TARGETARCH
ARG XRAY_VERSION=26.10.21
RUN apk add --no-cache ca-certificates unzip tzdata \
 && case "$TARGETARCH" in \
      amd64) ZIP=Xray-linux-64.zip ;; \
      arm64) ZIP=Xray-linux-arm64-v8a.zip ;; \
      *) echo "unsupported arch: $TARGETARCH" >&2; exit 1 ;; \
    esac \
 && wget -q "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/${ZIP}" -O /tmp/xray.zip \
 && unzip -o /tmp/xray.zip -d /usr/local/xray \
 && chmod +x /usr/local/xray/xray \
 && rm /tmp/xray.zip
COPY config.template.json /usr/local/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
