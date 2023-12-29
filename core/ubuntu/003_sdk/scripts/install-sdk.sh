#! /bin/bash

# https://stackoverflow.com/questions/53656537/install-sdkman-in-docker-image

# rm /bin/sh && ln -s /bin/bash /bin/sh
apt-get update && apt-get -qq -y install curl wget unzip zip
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
