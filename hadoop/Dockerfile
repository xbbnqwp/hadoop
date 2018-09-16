FROM ekiras/hadoop:base

WORKDIR /opt
ARG HADOOP_HOME=/opt/hadoop/

#-----COPY HADOOP
COPY hadoop-2.6.4.tar.gz /opt/
RUN tar -xvzf hadoop-2.6.4.tar.gz && mv /opt/hadoop-2.6.4 /opt/hadoop && rm hadoop-2.6.4.tar.gz
COPY conf/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml   
COPY conf/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
COPY conf/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml

#-----make datanode and name node
RUN mkdir -p /usr/local/hadoop_tmp/hdfs/namenode && mkdir -p /usr/local/hadoop_tmp/hdfs/datanode

#-----setup environments
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV YARN_HOME $HADOOP_HOME
ENV PATH $PATH:$JAVA_HOME/bin
ENV PATH $PATH:$HADOOP_HOME/bin
ENV PATH $PATH:$HADOOP_HOME/sbin


#-----expose ports
EXPOSE 8088 8042 50070

#-----
ENTRYPOINT service ssh start && hdfs namenode -format && start-dfs.sh && start-yarn.sh && tail -f /dev/null
