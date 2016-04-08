#!/usr/bin/env puma

bind "tcp://0.0.0.0:#{ENV['RAILS_PORT'] || 3000}"
