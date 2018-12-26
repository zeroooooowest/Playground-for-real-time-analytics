FROM ubuntu

RUN apt-get update && apt-get install -y python3 && apt-get install -y curl

ADD . /App

WORKDIR /App
RUN chmod +x /App/start.sh
EXPOSE  7090

ENTRYPOINT ["/App/start.sh"]
#CMD ["python3", "-m", "http.server", "7090"]
