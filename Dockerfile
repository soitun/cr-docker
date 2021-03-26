FROM zocker160/blender:latest

MAINTAINER zocker-160

ENV CR_VERSION latest
ENV persistent "false"
ENV local "false"

RUN apt-get update && apt-get install -y jq

WORKDIR /CR
COPY download_cr.sh .
COPY start_cr_server.sh .
COPY install_addon.py .

RUN chmod +x ./download_cr.sh && chmod +x ./start_cr_server.sh
RUN chmod -R 777 /CR

ENTRYPOINT ./start_cr_server.sh
