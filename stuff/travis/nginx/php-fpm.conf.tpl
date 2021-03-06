[global]
error_log = /tmp/php-fpm.log

[travis]
listen = 9000
listen.mode = 0666
pm = static
pm.max_children = 5
php_admin_flag[display_errors] = on
php_admin_flag[display_startup_errors] = on
php_admin_value[error_reporting] = E_ALL
php_admin_value[memory_limit] = 32M
