#!/bin/bash

if [ -z $POSTMAN_API_KEY ]
then
    echo "ERR: POSTMAN_API_KEY need to be set."
    exit 1
fi

if [ -z $POSTMAN_COLLECTION_ID ]
then
    echo "ERR: POSTMAN_COLLECTION_ID need to be set."
    exit 1
fi

if [ -z $POSTMAN_ENV_ID ]
then
    echo "ERR: POSTMAN_ENV_ID need to be set."
    exit 1
fi

if [ ! -d "collection" ]
then
    mkdir collection || exit 1;
fi

# GET POSTMAN COLLECTION
curl --location -s --request GET                                   \
"https://api.getpostman.com/collections/$POSTMAN_COLLECTION_ID" \
--header "X-API-Key: $POSTMAN_API_KEY"                          \
-o collection/collection.json

# GET POSTMAN ENVIRONMENT
curl --location -s --request GET                             \
"https://api.getpostman.com/environments/$POSTMAN_ENV_ID" \
--header "X-API-Key: $POSTMAN_API_KEY"                    \
-o collection/environment.json
