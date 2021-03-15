FROM alpine:3.12.3
RUN apk update
RUN apk upgrade
RUN apk add vim influxdb wget supervisor

ENV version_glibc 2.32
ENV version_teleg 1.17.0

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
ADD https://github.com/sgerrand/alpine-pkg-glibc/releases/download/"$version_glibc"-r0/glibc-"$version_glibc"-r0.apk /
RUN apk add glibc-"$version_glibc"-r0.apk

ADD https://dl.influxdata.com/telegraf/releases/telegraf-"$version_teleg"_linux_amd64.tar.gz /
RUN tar xf telegraf-"$version_teleg"_linux_amd64.tar.gz
RUN mv telegraf-"$version_teleg" telegraf
RUN cp -R telegraf/* /

RUN rm -rf glibc-"$version_glibc"-r0.apk telegraf-"$version_teleg"_linux_amd64.tar.gz telegraf

RUN mkdir -p /var/lib/influxdb
ADD telegraf.conf /etc/telegraf/telegraf.conf
ADD supervisord.conf /etc/supervisord.conf
RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

VOLUME ["/var/lib/influxdb"]
VOLUME ["/sys/fs/cgroup"]
EXPOSE 8086
CMD ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]