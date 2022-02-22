#!/bin/bash

# Install node_modules
yarn install

# build the project
yarn build --webpack
