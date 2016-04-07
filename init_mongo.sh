#!/usr/bin/env bash

# Set text searh to true
mongo --eval "db.adminCommand({ setParameter: true, textSearchEnabled : true})"
