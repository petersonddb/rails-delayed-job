#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
rake db:migrate
chmod +x bin/delayed_job
bin/delayed_job start
rails s -b '0.0.0.0'
