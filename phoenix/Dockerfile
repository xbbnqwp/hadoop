FROM ekiras/hbase:hadoop-2.6.4-hbase-1.3.1

ARG HADOOP_HOME="/opt/hadoop"
ARG HBASE_HOME="/opt/hbase"
ARG PHOENIX_HOME="/opt/phoenix"
ARG PHOENIX_VERSION="4.14.0-HBase-1.3"

#----------Setup hbase
COPY apache-phoenix-${PHOENIX_VERSION}-bin.tar.gz /opt/
COPY conf/hbase-env.sh ${HBASE_HOME}/conf
COPY conf/hbase-site.xml ${HBASE_HOME}/conf
COPY conf/regionservers ${HBASE_HOME}/conf

RUN apt-get install -y vim
RUN tar -xvzf apache-phoenix-${PHOENIX_VERSION}-bin.tar.gz && mv apache-phoenix-${PHOENIX_VERSION}-bin phoenix && rm apache-phoenix-${PHOENIX_VERSION}-bin.tar.gz
RUN cp /opt/phoenix/phoenix-${PHOENIX_VERSION}-server.jar ${HBASE_HOME}/lib
RUN cp /opt/phoenix/phoenix-${PHOENIX_VERSION}-client.jar ${HBASE_HOME}/lib
RUN cp /opt/phoenix/phoenix-core-${PHOENIX_VERSION}.jar ${HBASE_HOME}/lib



#----------Set env variables

ENV PHOENIX_HOME $PHOENIX_HOME
ENV PATH $PATH:$PHOENIX_HOME/bin

EXPOSE 50070 8042 8088 16010 9095 8085 2181


#------------------------
ENTRYPOINT service ssh start && hdfs namenode -format && start-dfs.sh && start-yarn.sh && start-hbase.sh && tail -f /dev/null
