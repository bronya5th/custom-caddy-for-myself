FROM caddy:builder AS builder

RUN xcaddy build \
#    --with github.com/caddyserver/nginx-adapter \
    --with github.com/RussellLuo/caddy-ext/ratelimit \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/kirsch33/realip \
    --with github.com/RussellLuo/caddy-ext/ratelimit \
    --with github.com/shift72/caddy-geo-ip \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy