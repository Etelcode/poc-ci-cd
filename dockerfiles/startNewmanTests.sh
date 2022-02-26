#!/bin/bash

docker run -v $PWD/collection:/newman -t postman/newman run /newman/collection.json -e /newman/environment.json
