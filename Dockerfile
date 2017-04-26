FROM sgrio/ubuntu-base
MAINTAINER SgrAlpha <admin@mail.sgr.io>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install curl nginx openssl --no-install-recommends -y && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048 && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=US/ST=New York/L=New York City/CN=localhost" \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt && \
    rm /etc/nginx/nginx.conf && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 443

COPY files /etc/nginx/

HEALTHCHECK --interval=10s --timeout=5s --retries=10 CMD curl --insecure https://localhost/ping || exit 1

WORKDIR /etc/nginx

CMD service nginx start