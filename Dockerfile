FROM php:8.2-apache

# Instalar mysqli
RUN docker-php-ext-install mysqli

# Desactivar event y activar prefork (evita el error AH00534)
RUN a2dismod mpm_event && a2enmod mpm_prefork

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Copiar archivos
COPY . /var/www/html

# Puerto dinámico de Railway
ENV PORT=8080
EXPOSE 8080

# Cambiar Apache al puerto de Railway
RUN sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf
RUN sed -i "s/:80/:${PORT}/" /etc/apache2/sites-enabled/000-default.conf
