FROM php:8.1-apache

# Copiar archivos del proyecto
COPY . /var/www/html/

# Reemplazar puerto 80 por el dinámico de Railway
RUN sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf \
    && sed -i "s/:80/:${PORT}/" /etc/apache2/sites-available/000-default.conf

# Exponer el puerto dinámico
EXPOSE ${PORT}

# Comando de inicio
CMD ["apache2-foreground"]
