FROM php:8.1-apache

# Instalar extensión mysqli
RUN docker-php-ext-install mysqli

# Deshabilitar otros MPM y habilitar solo prefork
RUN a2dismod mpm_event mpm_worker || true \
    && a2enmod mpm_prefork

# Copiar archivos del proyecto
COPY . /var/www/html/

# Configurar Apache para usar el puerto dinámico de Railway
RUN sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf \
    && sed -i "s/:80/:${PORT}/" /etc/apache2/sites-available/000-default.conf

# Exponer el puerto dinámico
EXPOSE ${PORT}

# Comando de inicio
CMD ["apache2-foreground"]
