FROM ilanyu/php-nginx:alpine-xdebug-base

MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN echo "zend_extension=/usr/lib/php7/modules/xdebug.so" > /etc/php7/conf.d/xdebug.ini && \
echo "xdebug.remote_enable=on" >> /etc/php7/conf.d/xdebug.ini && \
echo "xdebug.remote_autostart=off" >> /etc/php7/conf.d/xdebug.ini && \
echo "xdebug.remote_host=192.168.110.1" >> /etc/php7/conf.d/xdebug.ini

VOLUME /var/www/html

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
