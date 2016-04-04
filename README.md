<p style="text-align: center">
<img width="420" alt="Hello Kip!" src="https://cloud.githubusercontent.com/assets/4056725/14231995/c9b0a714-f998-11e5-8788-2fce29ff0c8b.png">
</p>

[![Build Status](https://travis-ci.org/Angelmmiguel/kip.svg?branch=master)](https://travis-ci.org/Angelmmiguel/kip)

# Kip

Kip is an open source Knowledge base for **teams**, because **knowledge is Power**. It's focused on writing, all team can write and edit the articles.

## Features

* It's **focused on writing**. Start to write in one click.
* You **don't need to register**
* **Markdown powered**
* **Powerful search in articles** (*In progress*)
* Highlight code snippets
* `docker-compose` ready
* Categories and authors are created on demand
* Store last 5 versions of the article (*In progress*)

# Run Kip

## Docker compose

To run Kip with [docker](https://docker.com/) follow it's [installation guide](https://docs.docker.com/engine/installation/). After docker engine and compose is installed, run next command in a terminal:

```bash
# Clone the project
git clone https://github.com/Angelmmiguel/kip.git
cd kip
# Run with docker compose
docker-compose up
```

Go to `http://localhost:3000` and start to write your articles :).

If you stop the services with `docker-compose stop` you can start them after with `docker-compose start` and restore all articles.

# Contributing

To contribute Kip:

* Create an issue with the contribution: feature, bug, enhancement...
* Fork the repository and make all changes you need
* Create a pull request when you finish

# License

Kip is released under the MIT license.
By [Angelmmiguel (@irbrocks)](https://twitter.com/irbrocks) ;)
