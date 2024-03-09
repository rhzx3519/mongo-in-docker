#!/bin/bash

cd "$(dirname "$0")"
SHELL_DIR="$(pwd)"

# load dotenv
if [ -f `${SHELL_DIR}/.env` ]
then
  export $(cat .env | xargs)
fi

for jsonfile in `ls -l ${SHELL_DIR} | grep '^-' | grep '.json$' | awk '{print $NF}'`
do

  mongoimport --host $MONGO_HOST --port $MONGO_PORT \
    --db $MONGO_DB \
    --file $jsonfile --collection ${jsonfile%.*}
done


