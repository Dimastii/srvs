FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add wget

RUN     mkdir -p /run/influxdb

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.4.0.linux-amd64.tar.gz
RUN tar -xvf grafana-enterprise-7.4.0.linux-amd64.tar.gz
RUN rm grafana-enterprise-7.4.0.linux-amd64.tar.gz

RUN mkdir /grafana-7.4.0/data

COPY  grafana.db /grafana-7.4.0/data/

EXPOSE 3000

WORKDIR grafana-7.4.0/bin/

CMD ["./grafana-server"]