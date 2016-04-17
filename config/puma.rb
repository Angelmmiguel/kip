#!/usr/bin/env puma

# Min and Max threads per worker
threads 1, 6

# Bind port
bind "tcp://0.0.0.0:#{ENV['PORT'] || 3000}"

# Correct environment
environment ENV['RACK_ENV'] || 'production'

# Daemonize
daemonize true

app_dir = File.expand_path('../..', __FILE__)
tmp_dir = "#{app_dir}/tmp"
log_dir = "#{app_dir}/log"

# Set up socket location
bind "unix://#{tmp_dir}/sockets/puma.sock"

# Logging
stdout_redirect(
  "#{log_dir}/puma.stdout.log",
  "#{log_dir}/puma.stderr.log",
  true
)

# Set master PID and state locations
pidfile "#{tmp_dir}/pids/puma.pid"
state_path "#{tmp_dir}/pids/puma.state"
activate_control_app
