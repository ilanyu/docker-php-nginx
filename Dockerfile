FROM ilanyu/php-nginx

MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN apk update && apk upgrade && \
apk add php7-dev gcc autoconf make g++ && \
pecl install xdebug && \
apk del gcc autoconf make g++ && \
rm -rf /var/cache/apk/*

VOLUME /var/www/html

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
