#!/usr/bin/env puma

# Bind port
bind "tcp://0.0.0.0:#{ENV['RAILS_PORT'] || 3000}"

# Correct environment
environment ENV['RACK_ENV'] || 'development'
