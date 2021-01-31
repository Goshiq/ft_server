FROM debian:buster

RUN apt -y update

RUN apt -y install vim
RUN apt -y install wget
RUN apt -y install nginx
RUN apt -y install mariadb-server
RUN apt -y install php php-mysql php-fpm php-cli php-mbstring

#nginx
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-english.tar.gz
RUN rm -f phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english /var/www/html/phpMyAdmin
COPY ./srcs/config_phpMyAdmin.php /var/www/html/phpmyadmin/

#WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm -f latest.tar.gz
#RUN chmod 777 -R wordpress
RUN mv wordpress /var/www/html/
COPY ./srcs/wp-config.php /var/www/html/wordpress

#ssl-cert
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Kazan/L=Kazan/O=jmogo/CN=jmogo' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

COPY ./srcs/init.sh /root
CMD bash /root/init.sh

EXPOSE 80 443
