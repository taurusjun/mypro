FROM alpine

ENV SS_VER=1.13.1
ENV V2_VER=1.3.1

RUN apk --no-cache add curl \
 && curl -L -s https://github.com/shadowsocks/shadowsocks-rust/releases/download/v$SS_VER/shadowsocks-v$SS_VER.x86_64-unknown-linux-musl.tar.xz | tar -xJf - -C /usr/local/bin \
 && curl -L -s https://github.com/shadowsocks/v2ray-plugin/releases/download/v$V2_VER/v2ray-plugin-linux-amd64-v$V2_VER.tar.gz | tar zxf - -C /usr/local/bin \
 && mv /usr/local/bin/v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin


CMD ssserver -s "[::]:$PORT" -m "chacha20-ietf-poly1305" -k "${SECRET:?password not set}" --plugin "v2ray-plugin" --plugin-opts "server;host=127.0.0.1;path=/" 
