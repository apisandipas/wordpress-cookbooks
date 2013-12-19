# Wordpress Cookbooks

Set of cookbooks to provision WordPress hosts with Sprinkle

## PHP Settings

- `max_execution_time = 60`
- `memory_limit = 256M`
- `post_max_size = 16M`
- `upload_max_filesize = 16M`

## PHP-FPM Settings

- `php_admin_value[memory_limit] = 256M`
- `php_admin_value[max_execution_time] = 60`