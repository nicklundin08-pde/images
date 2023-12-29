FROM ubuntu:latest as builder

COPY ./scripts/install-nvim.sh /install-nvim.sh
RUN chmod +x /install-nvim.sh 
RUN /install-nvim.sh
RUN rm /install-nvim.sh

FROM ubuntu:latest as final
COPY --from=builder /usr/local/bin/nvim  /usr/local/bin/nvim
COPY --from=builder /usr/local/share/nvim  /usr/local/share/nvim
