FROM debian:buster
ARG FTP_USER FTP_PASS
RUN apt update && apt install vsftpd -y
COPY ./conf/ftp.conf /etc/vsftpd.conf
RUN mkdir -p /var/run/vsftpd/empty && touch /var/run/vsftpd/empty/hi.txt
RUN useradd "$FTP_USER" && echo "$FTP_USER:$FTP_PASS" | chpasswd 
RUN mkdir -p /var/www/html 
RUN usermod -a -G www-data "$FTP_USER"
RUN chmod -R 777 /var/www/html 
RUN chmod a-w /var/www/html 
RUN echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
RUN mkdir /home/${FTP_USER} \
    && chown -R "$FTP_USER:$FTP_USER" /home/${FTP_USER} 
RUN chmod 777 /home/${FTP_USER}
EXPOSE 21
CMD ["vsftpd"]