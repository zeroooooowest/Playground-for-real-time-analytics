FROM ubuntu
LABEL maintainer="Aleksey Shibaev <shibaev@sfera.ru>"

# Fast Ubuntu mirror
# RUN sed --in-place --regexp-extended "s/(\/\/)(archive\.ubuntu)/\1ru.\2/" /etc/apt/sources.list && \
# 	apt-get update && apt-get upgrade --yes
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get update

RUN apt-get update && apt-get install -y python3 && apt-get install -y curl

ADD . /App

WORKDIR /App
RUN chmod +x /App/start.sh
EXPOSE  7090

ENTRYPOINT ["/App/start.sh"]
#CMD ["python3", "-m", "http.server", "7090"]
