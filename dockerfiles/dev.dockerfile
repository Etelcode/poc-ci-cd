FROM node:16

WORKDIR "/app"

ENTRYPOINT ["bash", "./dockerfiles/dev.entrypoint.sh"]
