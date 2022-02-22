FROM node:16

WORKDIR "/app"

ENTRYPOINT ["bash", "./dockerfiles/build.entrypoint.sh"]
