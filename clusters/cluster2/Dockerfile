FROM ekiras/hadoop:latest

WORKDIR /opt
ARG HADOOP_HOME=/opt/hadoop-2.9.1/

COPY conf/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY conf/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
COPY conf/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml 

RUN mkdir -p /usr/local/hadoop_tmp/hdfs/namenode && mkdir -p /usr/local/hadoop_tmp/hdfs/datanode
EXPOSE 8088 8020 50070
ENTRYPOINT service ssh start && hdfs namenode -format && start-dfs.sh && start-yarn.sh && tail -f /dev/null
