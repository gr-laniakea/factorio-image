FROM factoriotools/factorio:2.0.60
ARG USERNAME
ARG TOKEN
ENV FACTORIO_USERNAME=RecklessHeroism
ENV FACTORIO_TOKEN=87402bd4648ce37ceb7a6b5bb80518
ENV LOAD_LATEST_SAVE="false"
ENV SAVE_NAME="main"
RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz
RUN mkdir -p /opt/rcon
RUN tar -xzf rcon-0.10.3-amd64_linux.tar.gz
RUN mv rcon-0.10.3-amd64_linux/* /opt/rcon/
RUN rm -rf rcon-0.10.3-amd64_linux.tar.gz rcon-0.10.3-amd64_linux
RUN apt-get install -y fish curl nano python3-pip
COPY ./save-game ./write-user-token /bin/
RUN chmod +x /bin/save-game /bin/write-user-token
RUN python3 -m pip install --break-system-packages fac-cli
COPY ./fac.config.ini /root/.config/fac/config.ini
COPY ./*.json ./rconpw /opt/factorio/config/
COPY ./*.json ./rconpw /factorio/config/
EXPOSE 34197/udp
