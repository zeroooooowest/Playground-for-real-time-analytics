FROM aspektr/hadoop:2.9.1


ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline
RUN apt-get install -y --no-install-recommends netcat
COPY data/wikiticker-2015-09-12-sampled.json.gz /
RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]