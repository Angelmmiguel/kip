#!/usr/bin/env bash

echo "Start to update"
echo "--------"
docker-compose stop web
git pull
docker-compose build web
docker-compose up -d --no-deps web
echo "--------"
echo "Finish."
