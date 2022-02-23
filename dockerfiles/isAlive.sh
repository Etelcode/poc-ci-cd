#!/bin/bash

# This script is supposed to be run in the production container and exit if
# the service is considered as up.

echo hello

while ! curl -s localhost:3000/api
do
    sleep 1;
done
