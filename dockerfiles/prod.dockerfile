FROM node:16

WORKDIR "/app"

COPY ["./dist",                             \
      "./yarn.lock",                        \
      "./package.json",                     \
      "./dockerfiles/prod.entrypoint.sh",   \
      "./scripts/isAlive.sh",   \
      "./"]

ENTRYPOINT ["bash", "./prod.entrypoint.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
