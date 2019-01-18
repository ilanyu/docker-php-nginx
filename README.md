echo Hello > index.php

docker run -d -v .:/var/www/html/public -p 80:80 ilanyu/php-nginx
