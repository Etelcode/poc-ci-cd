# POC CI CD

[![CircleCI](https://circleci.com/gh/Etelcode/poc_ci_cd/tree/main.svg?style=svg)](https://circleci.com/gh/Etelcode/poc_ci_cd/tree/main)

> Proof Of Concept pipeline Continuous Intagration Continuous Deployement

# PURPOSES

- Discover what is a CI/CD pipeline.
- Leatn how to setup one pipeline to have a concrete, advanced example.

# Introduction

This project is completly useless at the end.
But by making this project and publish an example publicly, you can look at an
example of a functionnal CI/CD pipeline

# A good picture :

# Technologies

What is in this project ?
What used to create this pipeline ?

## The app

The app is just a REST API with three routes. Written in Typescript with Nestjs framework.

The app have a minimal linter and unit-tester.

The app have 3 docker image.
- Dev : hot reload container that used to dev into the project
- Build : Container that will build the project to create production files
- Prod : Container that will be deployed as production

## The pipeline

To create, host and run the CI/CD pipeline, we used CircleCI.

There is no reason to choose circleCI or another.

You can find the config file used by circle ci in /.circleci/config.yml.

# How to do ?

## Create the nest app

Just init a nestjs app with several routes.
Add basic unit-tests and a linter.

## Create docker images

For simplicity and flexibility, we build docker container to be able to push it
on docker hub. This is also a simpler and safer pratice to dev and run production
instances.

## Create docker-compose files

For staging and production deployment, there was many many solutions.
But the most flexible could be docker-compose.

Because you just have to call docker-compose up and the instance will fetch for
new versions of your docker images

## Create Makefile

Makefiles are very good to simplify scripts and interaction with a project.

So in this Makefile, you will find a lot of rules usefull, that are called by the
circleCI config file.

## Have a docker hub account

For staging and production deployment, we will push the built production docker
image on docker hub.

## CircleCI

You need to create a circleCI account, link with a repository, and set at least
the two environment variables.

DOCKER_HUB_LOGIN
DOCKER_HUB_PASS

## Postman

Because we want to make function tests (rather than just unit-tests) and its a
REST API project, we choose Newman to run our tests.

You can find the postman collection here : https://www.postman.com/restless-eclipse-694262/workspace/poc-ci-cd/collection/18232400-b2acad8c-49bb-4f2d-a7db-065e26fe31ae

To have a better newman setup, we create two scripts that will fetch for the tests
through the Postman API.
(/scripts/getNewmanTests.sh and /scripts/startNewmanTests.sh)

In circleCI, you will need 3 more environment variables :
POSTMAN_API_KEY
POSTMAN_COLLECTION_ID
POSTMAN_ENV_ID

## Notifications

In addition to mail notification, we wanted to test Telegram notifications.
So we used CircleCI webhooks that send events to a Google App Script that send
custom message to a telegram channel.

You can find the App Script code here : https://gist.github.com/lobbyra/65f5c742888856a3fe7900b73acca077

To use it :
- Create a Telegram bot with it in a channel.
- Create a Google Sheet and add a App Script as public web application.
- Paste the script and replace capitalized sentences at the begining of the file.
- Deploy the app script.
- Create a CicleCI webhook and paste the App Script link.

# What did we learned ?

CI/CD pipes are very usefull but could be complex to setup.

Now we will use these three docker image at the most projects as possible.
This is very usefull for dev and for circleCI usage.

How to deploy automaticly in staging and production

# FAQ

- Why docker-compose ?
In case of bigger projects, docker-compose are simpler instead of heroku deployments. Like if the app need a DB with demo data.
- Why Continuous Deployment instead of Continuous Delivery ?
A working continuous deployment looked more complexe and advanced.

# Random details

- From now, this is fully free on circleCI.
- The full CI/CD pipe take 2 minutes 30 to complete.
- Here you could the circleCI project page : https://app.circleci.com/pipelines/github/Etelcode/poc_ci_cd#

Feel free to contact us in case of any questions.
Happy pipes !
