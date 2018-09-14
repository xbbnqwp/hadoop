FROM ekiras/hadoop:2.6.4

ARG HBASE_HOME="/opt/hbase"
ARG HBASE_VERSION=1.1.2

#----------Setup hbase
COPY hbase-${HBASE_VERSION}-bin.tar.gz /opt
RUN tar -xvzf hbase-${HBASE_VERSION}-bin.tar.gz && mv /opt/hbase-${HBASE_VERSION} /opt/hbase && rm hbase-${HBASE_VERSION}-bin.tar.gz
COPY conf/hbase-env.sh /opt/hbase/conf
COPY conf/hbase-site.xml /opt/hbase/conf

#----------Set env variables

ENV HBASE_HOME $HBASE_HOME
ENV PATH $PATH:$HBASE_HOME/bin

EXPOSE 50070 8042 8088 16010 60010 9095 8085 2181


#------------------------
ENTRYPOINT service ssh start && hdfs namenode -format && start-dfs.sh && start-yarn.sh && start-hbase.sh && tail -f /dev/null
