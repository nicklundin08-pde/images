#! /bin/bash
set -e 

IMAGE="nlundin08/pde"
TAG="ubuntu_lvim_dotfiles"
IMAGE_TAG="$IMAGE:$TAG"

source ../../.env
echo 'Executing docker login'
echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin

docker build . -t $IMAGE_TAG
docker tag $IMAGE_TAG $IMAGE_TAG
docker push $IMAGE_TAG