FROM nlundin08/pde:ubuntu_personalized

SHELL ["/bin/bash", "-c"]

RUN source /root/.sdkman/bin/sdkman-init.sh \
    && sdk install java \
    && sdk install scala \
    && sdk install sbt \
    && sbt new scala/scala3.g8 --name="workspace"

## TODO: update nvim plugin with scala lang/metals stuff
## TODO: update entrypoint to be zsh in the workspace 
## TODO: update shell profiles to source sdk stuff
