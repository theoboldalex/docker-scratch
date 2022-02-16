FROM sykescottages/php:5.6-cli

RUN apt-get update && \
    apt-get install -y \
        php5.6-ldap \
        php5.6-redis \
        php5.6-gd \
        php5.6-memcache \
        php-pear \
        librabbitmq-dev \
        libmcrypt-dev

RUN curl -L https://phar.phpunit.de/phpunit-7.phar > /usr/local/bin/phpunit && \
    echo "079d70e7e6496c7f50ce3040613fc85fa2331b0309170e4e8a23fc512795228b7ad7c924de29e6b7dccc0513fceda405 /usr/local/bin/phpunit" | sha384sum --check && \
    chmod +x /usr/local/bin/phpunit

RUN pecl install amqp && \
    echo "extension=amqp.so" > /etc/php/5.6/cli/conf.d/amqp.ini;
