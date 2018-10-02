#!/bin/bash

# set up Superset if we haven't already
if [ ! -f /home/superset/.setup-complete ]; then
  echo "Running first time setup for Superset"

  echo "Creating admin user ${ADMIN_USERNAME}"
  cat > /home/superset/admin.config <<EOF
${ADMIN_USERNAME}
${ADMIN_FIRST_NAME}
${ADMIN_LAST_NAME}
${ADMIN_EMAIL}
${ADMIN_PWD}
${ADMIN_PWD}
EOF

  /bin/sh -c '/usr/local/bin/fabmanager create-admin --app superset < /home/superset/admin.config'

  rm /home/superset/admin.config

  echo "Initializing database"
  superset db upgrade

  echo "Creating default roles and permissions"
  superset init

  echo "Loading examples"
  superset load_examples

  touch /home/superset/.setup-complete
else
  # always upgrade the database, running any pending migrations
  superset db upgrade
fi

echo "Starting up Superset"
gunicorn superset:app
