#! /bin/bash
set -e 

DIR=$(pwd)
echo $DIR

# publish intermediate images
# cd $DIR/001_nvim/ && chmod +x publish.sh && ./publish.sh
# cd $DIR/002_lazyvim/ && chmod +x publish.sh && ./publish.sh
# cd $DIR/003_sdk/ && chmod +x publish.sh && ./publish.sh
cd $DIR/004_dotfiles/ && chmod +x publish.sh && ./publish.sh


## publish final image
IMAGE="nlundin08/pde"
TAG="ubuntu"
IMAGE_TAG="$IMAGE:$TAG"
FINAL_IMAGE_DIR="$DIR/004_dotfiles/"

cd $DIR
source ../../.env
echo 'Executing docker login'
echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin

cd $FINAL_IMAGE_DIR
docker build . -t $IMAGE_TAG
docker tag $IMAGE_TAG $IMAGE_TAG
docker push $IMAGE_TAG
