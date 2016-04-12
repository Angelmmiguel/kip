#!/usr/bin/env puma

# Bind port
bind "tcp://0.0.0.0:#{ENV['RAILS_PORT'] || 3000}"

# Daemonize the server
environment 'production'
pidfile 'tmp/pids/puma.pid'

# Correct environment
environment 'production'
