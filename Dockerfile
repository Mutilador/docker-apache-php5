FROM nimmis/apache:14.04

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y php5 libapache2-mod-php5 libapache2-mod-fcgid/trusty \
php5-fpm php5-cli php5-mysqlnd php5-pgsql php5-sqlite php5-redis  \
php5-apcu php5-intl php5-imagick php5-mcrypt php5-json php5-gd php5-curl php5-cgi && \
php5enmod mcrypt && \
rm -rf /var/lib/apt/lists/* && \
cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

ENV LANG=C
ENV APACHE_LOCK_DIR         /var/lock/apache2
ENV APACHE_RUN_DIR          /var/run/apache2
ENV APACHE_PID_FILE         ${APACHE_RUN_DIR}/apache2.pid
ENV APACHE_LOG_DIR          /var/log/apache2
ENV APACHE_RUN_USER         www-data
ENV APACHE_RUN_GROUP        www-data
ENV APACHE_MAX_REQUEST_WORKERS 32
ENV APACHE_MAX_CONNECTIONS_PER_CHILD 1024
ENV APACHE_ALLOW_OVERRIDE   None
ENV APACHE_ALLOW_ENCODED_SLASHES Off
ENV APACHE_ERRORLOG         ""
ENV APACHE_CUSTOMLOG        ""
ENV APACHE_LOGLEVEL         error
ENV PHP_TIMEZONE            America/Sao_Paulo
ENV PHP_MBSTRING_FUNC_OVERLOAD 0
ENV PHP_ALWAYS_POPULATE_RAW_POST_DATA 0
