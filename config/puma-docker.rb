#!/usr/bin/env puma

# Min and Max threads per worker
threads 1, 6

# Bind port
bind "tcp://0.0.0.0:#{ENV['PORT'] || 3000}"

# Correct environment
environment ENV['RACK_ENV'] || 'development'
