# Wordpress Cookbooks

Set of cookbooks to provision WordPress sites with Sprinkle

## Install

Clone repository:

```
git clone git@gitslice.com:wordpress-cookbooks.git
```

Install dependencies:

```
bundle install
```

## Usage

Copy config file:

```
cp config.yml.sample config.yml
```

To provision a server run:

```
bundle exec sprinkle -s ./build.rb 
```