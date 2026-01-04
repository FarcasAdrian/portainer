FROM php:8.4

# Install dependencies
RUN apt-get update && apt-get install -y git curl zip unzip netcat-openbsd

# Install php extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && apt-get install -y nodejs

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Install Laravel installer
RUN composer global require laravel/installer

# Add Composer global bin to PATH
ENV PATH="$PATH:/root/.composer/vendor/bin"

# Go to web server dir
WORKDIR /var/www/html

# Create Laravel project
RUN laravel new app

# Go to laravel project directory
WORKDIR /var/www/html/app

# Install JS dependencies
RUN npm install && npm run build

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE ${MYSQL_TCP_PORT} ${LARAVEL_PORT}

ENTRYPOINT ["entrypoint.sh"]