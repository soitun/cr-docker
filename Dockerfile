FROM zocker160/blender:2.91

MAINTAINER zocker-160

ENV CR_VERSION cr_029_bl280
ENV persistent "false"

RUN apt-get update && apt-get install -y jq

WORKDIR /CR
COPY download_cr.sh .
COPY start_cr_server.sh .
COPY install_addon.py .

RUN chmod +x ./download_cr.sh && chmod +x ./start_cr_server.sh
RUN chmod -R 777 /CR

ENTRYPOINT ./start_cr_server.sh
