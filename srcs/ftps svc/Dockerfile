FROM alpine:3.7

RUN apk add openssl vsftpd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -out /etc/ssl/certs/ftps.pem \
    -keyout /etc/ssl/private/ftps.key \
     -subj "/C=RU/ST=-/L=-/O=-/OU=-/CN=ft_srvc"
RUN rm /etc/vsftpd/vsftpd.conf

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod -R 777 /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/log/ftp
RUN touch /var/log/ftp/xferlog

EXPOSE 21 21100

RUN echo 'root:root' | chpasswd

ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf
