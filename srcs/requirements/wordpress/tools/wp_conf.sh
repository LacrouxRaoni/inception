#!/bin/bash

if [ ! -d "/var/www/wordpress/wp-config.php" ]; then
    wp core download --allow-root

    wp core config --dbhost="${MARIADB_ROOT_HOST}" --dbname="${MARIADB_DATABASE}" --dbuser="${MARIADB_USER}" --dbpass="${MARIADB_PASSWORD}" --allow-root

    wp core install --url="${DOMAIN_NAME}" --title="${DOMAIN_NAME}" --admin_name="${WP_ADM_USR}" --admin_password="${WP_ADM_PSW}" --admin_email="${WP_ADM_MAIL}" --allow-root
    
    wp user create "${WP_USR}" "${WP_USR_MAIL}" --user_pass="${WP_PSW}" --porcelain --allow-root

fi

php-fpm7.3 -F

