FROM amazonlinux:2

RUN amazon-linux-extras enable php7.4 && amazon-linux-extras install nginx1.12 && yum clean metadata

# config php
RUN yum install -y unzip curl php php-common php-pgsql php-curl php-gd php-mbstring php-xmlrpc php-intl php-zlib php-bcmath php-xml && \
    yum clean all && \
    rm -rf /var/cache/yum

# RUN mv /etc/nginx /etc/nginx-backup
WORKDIR /var/www/html

COPY src/api /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer

RUN chown -R :nginx /var/www/html && \
    chmod 2775 /var/www/html && \
    chown -R :nginx storage && \
    chown -R :nginx bootstrap/cache && \
    chgrp -R nginx storage bootstrap/cache && \
    chmod -R ug+rwx storage bootstrap/cache

COPY /docker/configs/nginx/sites-available/* /etc/nginx/sites-available/

RUN mkdir /etc/nginx/sites-enabled

RUN ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

RUN systemctl start nginx

# Expose port 80
EXPOSE 80

# Last is the actual command to start up NGINX within our Container
CMD ["nginx", "-g", "daemon off;"]
CMD ["/usr/sbin/init"]

