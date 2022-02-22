###############################################
#         _       _               _           #
#        | |     | |             | |          #
#     ___| |_ ___| | ___ ___   __| | ___      #
#    / _ \ __/ _ \ |/ __/ _ \ / _` |/ _ \     #
#   |  __/ ||  __/ | (_| (_) | (_| |  __/     #
#    \___|\__\___|_|\___\___/ \__,_|\___|.fr  #
#                                             #
###############################################

name = "poc"

# THE CONTAINER THAT HOT-RELOAD THE CODE, USED TO WORK ON THE CODE
dev				:
				@docker kill dev-$(name) || true
				@docker rm dev-$(name) || true
				docker build -f dockerfiles/dev.dockerfile -t dev-$(name) .
				docker run 																\
				--name dev-$(name) --mount type=bind,source='$(shell pwd)',target=/app	\
				-p 3000:3000															\
				dev-$(name):latest

killBuilder		:
				@docker kill builder-$(name) || true
				@docker rm builder-$(name) || true

# THE BUILDER WILL CREATE THE DIST COMPILED PROJECT IN HOST FILESYSTEM
# USED TO NOT PUBLISH THE PRETTY SOURCE CODE
builder			: killBuilder
				sudo rm -rf dist node_modules
				docker build -f dockerfiles/build.dockerfile -t builder-$(name) .
				docker run											\
				--name dev-$(name) 										\
				--mount type=bind,source='$(shell pwd)',target=/app	\
				builder-$(name)

# CREATES THE IMAGE THAT WILL BE PUBLISHED ON DOCKER HUB
build			: builder
				docker build -f dockerfiles/prod.dockerfile \
							 -t etelcode/$(name)-ci-cd:latest .

# START THE PRODUCTION IMAGE
# IF YOU WANT TO RUN THE PRODUCTION IMAGE LOCALLY
prod			:
				@echo "Be sure that prod is not running and you already built the image"
				docker run						\
				--name prod-$(name) 			\
				-p 3000:3000					\
				-d								\
				etelcode/$(name)-ci-cd:latest

# STOP ALL RUNNING CONTAINERS
kill			:
				@echo "stopping dev and prod container"
				@docker kill dev-$(name) prod-$(name) build-$(name) \
					2> /dev/null || true
				@docker rm dev-$(name) prod-$(name) build-$(name) \
					2> /dev/null || true

# PUSH TO DOCKER HUB WITH THE STAGGING TAG
pushStagging	: build
				docker login
				docker tag etelcode/$(name)-ci-cd:latest etelcode/$(name)-ci-cd:stagging
				docker push etelcode/$(name)-ci-cd:stagging

# PUSH TO DOCKER HUB WITH THE LATEST TAG
pushRelease		: build
				docker login
				docker push etelcode/$(name)-ci-cd:latest

%:
	@:

# FORCE MAKE TO NOT EXECUTE TASKS IN PARALLEL
.NOTPARALLEL:
