FROM nlundin08/pde:ubuntu_lazyvim

# SHELL ["/bin/bash", "-c"]    

COPY ./scripts/install-sdk.sh /install-sdk.sh

RUN chmod +x /install-sdk.sh && /install-sdk.sh && rm /install-sdk.sh


## If you need to access sdkman inside a dockerfile, do so like this
# SHELL ["/bin/bash", "-c"]
# RUN source /root/.sdkman/bin/sdkman-init.sh && sdk version