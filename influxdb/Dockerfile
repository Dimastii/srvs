FROM    alpine:3.12.3

RUN     apk update
RUN     apk add supervisor ca-certificates influxdb

RUN     mkdir -p /run/influxdb
RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN     apk add glibc-2.32-r0.apk
RUN     mkdir -p /var/lib/influxdb

RUN     wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz
RUN     tar -xzvf telegraf-1.16.1_linux_amd64.tar.gz --strip-components 1 -C ./
RUN     rm -rf telegraf-1.16.1_linux_amd64.tar.gz

RUN     cp -r /telegraf-1.16.1/* /

RUN		./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY   ./supervisord.conf   /etc/supervisord.conf

RUN mkdir -p /var/lib/influxdb

VOLUME	["var/lib/influxdb"]

EXPOSE  8086

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]