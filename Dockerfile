FROM php:8.2-apache

RUN docker-php-ext-install mysqli

RUN rm -rf /var/www/html/*

RUN echo "<?php phpinfo(); ?>" > /var/www/html/index.php

CMD ["apache2-foreground"]