FROM php:8.2-apache

# Instalar mysqli (NECESARIO para conectar a Railway)
RUN docker-php-ext-install mysqli

# Habilitar mod_rewrite (no es obligatorio, pero recomendado)
RUN a2enmod rewrite

# Copiar todos tus archivos (como están en la raíz)
COPY . /var/www/html

# Railway usa un puerto dinámico
ENV PORT=8080
EXPOSE 8080

# Cambiar Apache para escuchar el puerto de Railway
RUN sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf
RUN sed -i "s/:80/:${PORT}/" /etc/apache2/sites-enabled/000-default.conf
