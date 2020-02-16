#!/bin/bash
set -e

if [ "$WORKER" = 'true' ]; then
  chmod +x bin/delayed_job
  bin/delayed_job -n 2 start # TODO: Use an env. variable to set n
  sleep infinity
else
  rm -f /app/tmp/pids/server.pid
  rails db:migrate
  rails s -b '0.0.0.0'
fi
