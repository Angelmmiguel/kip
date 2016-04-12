<p style="text-align: center">
<img width="420" alt="Hello Kip!" src="https://cloud.githubusercontent.com/assets/4056725/14231995/c9b0a714-f998-11e5-8788-2fce29ff0c8b.png">
</p>

[![CircleCI](https://img.shields.io/circleci/project/Angelmmiguel/kip/master.svg?style=flat-square)](https://circleci.com/gh/Angelmmiguel/kip/tree/master)
[![Coverage Status](https://coveralls.io/repos/github/Angelmmiguel/kip/badge.svg?branch=master)](https://coveralls.io/github/Angelmmiguel/kip?branch=master)

# Kip

Kip is an open source Knowledge base for **teams**, because **knowledge is Power**. It's focused on writing, all team can write and edit the articles.

## Features

* It's **focused on writing**. Start to write in one click.
* You **don't need to register**
* **Markdown powered**
* **Powerful search in articles**
* Highlight code snippets
* `docker-compose` ready
* Categories and authors are created on demand
* Store last 5 versions of the article (*In progress*)

# Run Kip

## Docker compose

To run Kip with [docker](https://docker.com/) follow it's [installation guide](https://docs.docker.com/engine/installation/) to get `docker-engine` and `docker-compose`. After install docker tools, run next commands in a terminal:

```bash
# Clone the project
git clone https://github.com/Angelmmiguel/kip.git
cd kip
# Create secrets file. You can skip this command if you create config/secrets.env
# with the following format:
#
# # Content of config/secrets.env
# SECRET_KEY_BASE=$string
# # Where $string is an alphanumeric lowercase random string with 128 characters.
#
echo "SECRET_KEY_BASE=$(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-z0-9' | fold -w 128 | head -n 1)" >> config/secrets.env
# Run with docker compose
docker-compose up
```

Go to `http://localhost:3000` and start to write your articles :).

If you stop the services with `docker-compose stop` you can start them after with `docker-compose start` and restore all articles.

# Screenshots

## Welcome

![welcome](https://cloud.githubusercontent.com/assets/4056725/14265458/d351830e-fac1-11e5-9c44-9e9cb08aa0aa.png)

More screenshots in the [Wiki](https://github.com/Angelmmiguel/kip/wiki/Screenshots)

# Contributing

To contribute Kip:

* Create an issue with the contribution: feature, bug, enhancement...
* Fork the repository and make all changes you need
* Create a pull request when you finish

# License

Kip is released under the MIT license.
By [Angelmmiguel (@irbrocks)](https://twitter.com/irbrocks) ;)
