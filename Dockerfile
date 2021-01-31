FROM debian:buster

RUN apt -y update

RUN apt -y install vim
RUN apt -y install wget
RUN apt -y install nginx
RUN apt -y install mariadb-server
RUN apt -y install php php-mysql php-fpm php-mbstring

RUN rm -f /var/www/html/index.nginx-debian.html

#nginx
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-english.tar.gz
RUN rm -f phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english /var/www/html/phpmyadmin
RUN mkdir -p /var/www/html/phpmyadmin/tmp/
COPY ./srcs/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php

#WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm -f latest.tar.gz
RUN chmod 755 -R wordpress
RUN mv wordpress /var/www/html/
COPY ./srcs/wp-config.php /var/www/html/wordpress

#ssl-cert
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Kazan/L=Kazan/O=jmogo/CN=jmogo' -keyout /etc/nginx/localhost-key.pem -out /etc/nginx/localhost.pem

RUN chown -R www-data:www-data /var/www
COPY ./srcs/init.sh /root
COPY ./srcs/switch_autoindex.sh /root
RUN chown -R www-data:www-data /root/*
RUN chmod 777 /etc/nginx/*
CMD bash /root/init.sh

EXPOSE 80 443
