FROM johnshine/baidunetdisk-crossover-vnc:latest
MAINTAINER Anthony "cngzwing@vip.163.com"

LABEL Author="LiBoWen"
LABEL Version="2019.12"
LABEL Descruption="natapp 封装"

ENV TIMEZONE Asia/Chongqing
ENV DEBIAN_FRONTEND noninteractive
ENV AUTH_TOKEN=""

RUN sudo yum install -y unzip

RUN curl -o /tmp/natapp.zip http://download.natapp.cn/assets/downloads/clients/2_3_9/natapp_linux_amd64_2_3_9.zip \
    && cd /tmp \
    && unzip natapp.zip \
    && chmod 755 natapp \
    && sudo mv natapp /bin \
    && rm -f natapp.zip

RUN sudo sed -i "3i\/bin/natapp -authtoken=\$\{AUTH_TOKEN\} &" /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
