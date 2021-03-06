#!/bin/bash
################################################################################
##  File:  php.sh
##  Team:  CI-Platform
##  Desc:  Installs php
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

LSB_RELEASE=$(lsb_release -rs)

set -e

apt-add-repository ppa:ondrej/php -y

# Install php5.6
apt-get update
apt-fast install -y --no-install-recommends \
    php5.6 \
    php5.6-amqp \
    php5.6-bcmath \
    php5.6-bz2 \
    php5.6-cgi \
    php5.6-cli \
    php5.6-common \
    php5.6-curl \
    php5.6-dba \
    php5.6-dev \
    php5.6-enchant \
    php5.6-fpm \
    php5.6-gd \
    php5.6-gmp \
    php5.6-imap \
    php5.6-interbase \
    php5.6-intl \
    php5.6-json \
    php5.6-ldap \
    php5.6-mbstring \
    php5.6-mcrypt \
    php5.6-mysql \
    php5.6-odbc \
    php5.6-opcache \
    php5.6-pgsql \
    php5.6-phpdbg \
    php5.6-pspell \
    php5.6-readline \
    php5.6-recode \
    php5.6-snmp \
    php5.6-soap \
    php5.6-sqlite3 \
    php5.6-sybase \
    php5.6-tidy \
    php5.6-xml \
    php5.6-xmlrpc \
    php5.6-xsl \
    php5.6-zip
apt-get remove --purge -yq php5.6-dev

# Install php7.0
apt-fast install -y --no-install-recommends \
    php7.0 \
    php7.0-amqp \
    php7.0-bcmath \
    php7.0-bz2 \
    php7.0-cgi \
    php7.0-cli \
    php7.0-common \
    php7.0-curl \
    php7.0-dba \
    php7.0-dev \
    php7.0-enchant \
    php7.0-fpm \
    php7.0-gd \
    php7.0-gmp \
    php7.0-imap \
    php7.0-interbase \
    php7.0-intl \
    php7.0-json \
    php7.0-ldap \
    php7.0-mbstring \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-odbc \
    php7.0-opcache \
    php7.0-pgsql \
    php7.0-phpdbg \
    php7.0-pspell \
    php7.0-readline \
    php7.0-recode \
    php7.0-snmp \
    php7.0-soap \
    php7.0-sqlite3 \
    php7.0-sybase \
    php7.0-tidy \
    php7.0-xml \
    php7.0-xmlrpc \
    php7.0-xsl \
    php7.0-zip
apt-get remove --purge -yq php7.0-dev

# Install php7.1
apt-fast install -y --no-install-recommends \
    php7.1 \
    php7.1-amqp \
    php7.1-bcmath \
    php7.1-bz2 \
    php7.1-cgi \
    php7.1-cli \
    php7.1-common \
    php7.1-curl \
    php7.1-dba \
    php7.1-dev \
    php7.1-enchant \
    php7.1-fpm \
    php7.1-gd \
    php7.1-gmp \
    php7.1-imap \
    php7.1-interbase \
    php7.1-intl \
    php7.1-json \
    php7.1-ldap \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-mysql \
    php7.1-odbc \
    php7.1-opcache \
    php7.1-pgsql \
    php7.1-phpdbg \
    php7.1-pspell \
    php7.1-readline \
    php7.1-recode \
    php7.1-snmp \
    php7.1-soap \
    php7.1-sqlite3 \
    php7.1-sybase \
    php7.1-tidy \
    php7.1-xml \
    php7.1-xmlrpc \
    php7.1-xsl \
    php7.1-zip
apt-get remove --purge -yq php7.1-dev

# Install php7.2
apt-fast install -y --no-install-recommends \
    php7.2 \
    php7.2-apcu \
    php7.2-amqp \
    php7.2-bcmath \
    php7.2-bz2 \
    php7.2-cgi \
    php7.2-cli \
    php7.2-common \
    php7.2-curl \
    php7.2-dba \
    php7.2-dev \
    php7.2-enchant \
    php7.2-fpm \
    php7.2-gd \
    php7.2-gmp \
    php7.2-imap \
    php7.2-interbase \
    php7.2-intl \
    php7.2-json \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-odbc \
    php7.2-opcache \
    php7.2-pgsql \
    php7.2-phpdbg \
    php7.2-pspell \
    php7.2-readline \
    php7.2-recode \
    php7.2-snmp \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-sybase \
    php7.2-tidy \
    php7.2-xml \
    php7.2-xmlrpc \
    php7.2-xsl \
    php7.2-zip

apt-fast install -y --no-install-recommends \
    php-igbinary \
    php-memcache \
    php-memcached \
    php-mongodb \
    php-redis \
    php-xdebug \
    php-yaml \
    php-zmq

apt-get remove --purge -yq php7.2-dev

apt-fast install -y --no-install-recommends snmp

# Install composer
apt-fast install -y composer

# Install phpunit (for PHP)
wget -q -O phpunit https://phar.phpunit.de/phpunit-7.phar
chmod +x phpunit
mv phpunit /usr/local/bin/phpunit

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
for cmd in php php5.6 php7.0 php7.1 php7.2 composer phpunit; do
    if ! command -v $cmd; then
        echo "$cmd was not installed"
        exit 1
    fi
done

# Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "PHP 5.6 ($(php5.6 --version | head -n 1))"
DocumentInstalledItem "PHP 7.0 ($(php7.0 --version | head -n 1))"
DocumentInstalledItem "PHP 7.1 ($(php7.1 --version | head -n 1))"
DocumentInstalledItem "PHP 7.2 ($(php7.2 --version | head -n 1))"
DocumentInstalledItem "Composer  ($(composer --version))"
DocumentInstalledItem "PHPUnit ($(phpunit --version))"
