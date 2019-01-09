FROM ubuntu
LABEL maintainer="Aleksey Shibaev <shibaev@sfera.ru>"

ENV HTTP_PROXY: http://s-proxy-04-g.global.bcs:8080
ENV HTTPS_PROXY: http://s-proxy-04-g.global.bcs:8080

# Fast Ubuntu mirror
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
# Trying manually replace mirror, because mirrors.ubuntu.com is banned
RUN sed --in-place --regexp-extended "s/(\/\/)(archive\.ubuntu)/\1ru.\2/" /etc/apt/sources.list

RUN apt-get update && apt-get install -y python3 && apt-get install -y curl

ADD . /App

WORKDIR /App
RUN chmod +x /App/start.sh
EXPOSE  7090

ENTRYPOINT ["/App/start.sh"]
#CMD ["python3", "-m", "http.server", "7090"]
