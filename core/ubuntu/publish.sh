#! /bin/bash
set -e 

DIR=$(pwd)
IMAGE="nlundin08/pde"

source ../../.env
echo 'Executing docker login'
echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin

publish_image(){
    TAG=$1
    CONTEXT_DIR=$2
    IMAGE_TAG="$IMAGE:$TAG"
    # echo "    publish image called! tag:$TAG ctx:$CONTEXT_DIR"
    # echo "cd $CONTEXT_DIR"
    cd "$CONTEXT_DIR"
    # echo $CONTEXT_DIR | cd
    # pwd
    docker build . -t $IMAGE_TAG
    docker tag $IMAGE_TAG $IMAGE_TAG
    docker push $IMAGE_TAG
}

# SKIPS=("ubuntu_nvim/" "")
IFS='-'
for d in */ ; do
    DIRECTORY=$d
    # echo "$d"
    # if [[ $(echo ${SKIPS[@]} | fgrep -w $d) ]]
    # then
    #     echo "    Should skip"
    # else
    #     echo "    Should not skip"
    # fi
    read -ra elements <<< "$d"
    TAG_TO_PUBLISH=${elements[1]}
    SANITIZED_TAG=${TAG_TO_PUBLISH%/}
    # echo "publish_image "$TAG_TO_PUBLISH" `$DIRECTORY`"
    publish_image "$SANITIZED_TAG" "$DIR/$d"
done




