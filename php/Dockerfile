FROM php:8.3-fpm

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    curl git unzip zip \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libzip-dev libicu-dev libxml2-dev libxslt-dev \
    libssl-dev pkg-config ca-certificates \
    build-essential autoconf \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql gd intl zip soap xsl bcmath sockets ftp \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && echo "memory_limit = 2G" > /usr/local/etc/php/conf.d/memory-limit.ini \ 
    # Cleanup to reduce image size
    && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf
# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer
RUN groupadd -g 1000 clp && \
    useradd -u 1000 -g clp -m test-ssh

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# Set working directory
WORKDIR /var/www/html

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Entrypoint
CMD ["/entrypoint.sh"]
