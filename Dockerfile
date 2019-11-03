FROM debian
RUN apt-get update && apt-get install -y jq curl procps ttf-dejavu openjdk-11-jre x11-xserver-utils 

RUN useradd -d /minecraft -s /bin/sh minecraft

ARG SOURCE=https://tlauncherrepo.com/legacy_beta/bootstrap
# https://turikhay.ru/tlauncher/legacy_beta/bootstrap
# https://u.tlauncher.ru/legacy_beta/bootstrap

RUN mkdir -p /opt/tlauncher && \
    checksum=$(curl -sL 'http://cdn.turikhay.ru/tlauncher/legacy_beta/bootstrap.json' | jq -r '.update.bootstrap.downloads.JAR.checksum') && \
    curl -sL "${SOURCE}/${checksum}.jar" -o '/opt/tlauncher/tlauncher.jar' && \
    chown minecraft:minecraft -R /opt/tlauncher

USER minecraft
ENTRYPOINT java -jar /opt/tlauncher/tlauncher.jar && \
           while :; do [ $(pgrep -f tlauncher | wc -l) -gt 2 ] && sleep 5 || exit 0; done
