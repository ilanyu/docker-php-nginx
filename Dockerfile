FROM ilanyu/php-nginx

MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN apk update && apk upgrade && \
apk add php7-dev gcc autoconf make g++ && \
pecl install xdebug && \
apk del gcc autoconf make g++ && \
rm -rf /var/cache/apk/* && \
echo "zend_extension=/usr/lib/php7/modules/xdebug.so" > /etc/php7/conf.d/xdebug.ini && \
echo "xdebug.remote_enable=on" >> /etc/php7/conf.d/xdebug.ini && \
echo "xdebug.remote_autostart=off" >> /etc/php7/conf.d/xdebug.ini && \
echo "xdebug.remote_host=192.168.110.1" >> /etc/php7/conf.d/xdebug.ini

VOLUME /var/www/html

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
