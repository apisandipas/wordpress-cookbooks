# Wordpress Cookbooks

Set of cookbooks to provision WordPress hosts with Sprinkle

## Overview

Cookbooks are made for 64-bit Ubuntu 12.04 LTS and will provide the following stack:

- PHP 5.4 + extensions
- PHP-FPM
- Nginx
- Git
- Subversion
- MySQL

## Installation

Clone repository and install dependencies:

```
git clone https://github.com/doejo/wordpress-cookbooks.git
bundle install
```

## Usage

Create a new config.yml or copy an example one:

```
cp config.yml.sample config.yml
```

Change target server ip and password:

```yaml
target:
  host: "ip address of your server"
  user: "root"
  password: "root"
  port: 22
```

Then start build script:

```
bundle exec sprinkle -s ./build.rb
```

## Settings

**PHP Settings**

- `max_execution_time = 60`
- `memory_limit = 256M`
- `post_max_size = 16M`
- `upload_max_filesize = 16M`

**PHP-FPM Settings**

- `php_admin_value[memory_limit] = 256M`
- `php_admin_value[max_execution_time] = 60`

## License

The MIT License (MIT)