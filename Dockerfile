FROM php:8.2-apache

# Instalar mysqli
RUN docker-php-ext-install mysqli

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Copiar archivos
COPY . /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]