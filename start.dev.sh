#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid
rails db:migrate
chmod +x bin/delayed_job
bin/delayed_job -n 2 start # TODO: Use an env. variable to set n
rails s -b '0.0.0.0'
