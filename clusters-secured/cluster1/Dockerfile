FROM ekiras/hadoop:latest
USER root
WORKDIR /opt
ARG HADOOP_HOME=/opt/hadoop-2.9.1/
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop/


COPY conf/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY conf/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
COPY conf/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml 
COPY conf/ssl-server.xml /opt
COPY conf/ssl-client.xml /opt

COPY scripts/ssh-server.sh /opt/ssh-server.sh
COPY scripts/restart.sh /


RUN mkdir -p /usr/local/hadoop_tmp/hdfs/namenode && mkdir -p /usr/local/hadoop_tmp/hdfs/datanode
RUN bash /opt/ssh-server.sh
# 8088 - Resource manager web
# 9870 - Namenode web
# 19888 - Mapreduce job histpry web
EXPOSE 8088 8020 50070 9870 19888
ENTRYPOINT service ssh start && hdfs namenode -format && start-dfs.sh && start-yarn.sh && tail -f /dev/null
