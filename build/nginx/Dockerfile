FROM debian:buster

RUN apt update

RUN apt install -y nginx
# RUN whoami > /var/www/html/index.html

EXPOSE 80
RUN chown -R root:root  /var/www/html
RUN chmod -R 777 /var/www/html
# # RUN chmod -R 755 /var/www/html
# RUN chmod 777 /var/www/html/
# RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html && \
#         chown -R www-data:www-data /etc/nginx/&& \
#         chown -R www-data:www-data /var/log/nginx && \
#         chown -R www-data:www-data /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
