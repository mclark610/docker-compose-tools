#!/usr/bin/sh
# -------------------------------------------------
# this script waits for postgres to answer before
# running the command to link to it from 
# a container that uses it.
# -------------------------------------------------
# wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

until docker run -it --rm --network docker-system_default --link some-postgres:postgres postgres psql -h ${host} -U postgres -c '\q'; do

#until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd


