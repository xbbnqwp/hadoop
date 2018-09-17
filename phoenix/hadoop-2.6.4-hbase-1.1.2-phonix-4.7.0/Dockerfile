FROM ekiras/hbase:hadoop-2.6.4-hbase-1.3.1

ARG HADOOP_HOME="/opt/hadoop"
ARG HBASE_HOME="/opt/hbase"
ARG PHOENIX_HOME="/opt/phoenix"
ARG PHOENIX_VERSION="4.7.0-HBase-1.1"
ARG hostname="hdp.hw.com"
#----------Setup hbase
#COPY phoenix-${PHOENIX_VERSION}-bin.tar.gz /opt/

COPY conf/hbase-env.sh ${HBASE_HOME}/conf
COPY conf/hbase-site.xml ${HBASE_HOME}/conf
COPY conf/regionservers ${HBASE_HOME}/conf
COPY conf/core-site.xml ${HADOOP_HOME}/etc/hadoop/

RUN apt-get install -y vim
RUN curl -o /opt/phoenix-${PHOENIX_VERSION}-bin.tar.gz https://archive.apache.org/dist/phoenix/phoenix-${PHOENIX_VERSION}/bin/phoenix-${PHOENIX_VERSION}-bin.tar.gz && tar -xvzf phoenix-${PHOENIX_VERSION}-bin.tar.gz && mv phoenix-${PHOENIX_VERSION}-bin phoenix && rm phoenix-${PHOENIX_VERSION}-bin.tar.gz
RUN cp /opt/phoenix/phoenix-${PHOENIX_VERSION}-server.jar ${HBASE_HOME}/lib
RUN cp /opt/phoenix/phoenix-${PHOENIX_VERSION}-client.jar ${HBASE_HOME}/lib
RUN cp /opt/phoenix/phoenix-core-${PHOENIX_VERSION}.jar ${HBASE_HOME}/lib
COPY conf/phoenix-hbase-site.xml $PHOENIX_HOME/bin/hbase-site.xml


#----------Set env variables

ENV PHOENIX_HOME $PHOENIX_HOME
ENV PATH $PATH:$PHOENIX_HOME/bin

EXPOSE 50070 8042 8088 16000 16010 16020 9095 8085 2181


#------------------------
ENTRYPOINT sed -i "s/{{HOST}}/`hostname`/g" $HADOOP_HOME/etc/hadoop/core-site.xml \
           && sed -i "s/{{HOST}}/`hostname`/g" $HBASE_HOME/conf/hbase-site.xml \
           && sed -i "s/{{HOST}}/`hostname`/g" $HBASE_HOME/conf/regionservers \
           && service ssh start && hdfs namenode -format && start-dfs.sh && start-yarn.sh && start-hbase.sh && tail -f /dev/null
