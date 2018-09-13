FROM ekiras/phoenix:hdp-2.6.4-hbase-1.3.1-phoenix-4.14.0
WORKDIR /opt

ARG hostname

COPY conf/core-site.xml $HADOOP_HOME/etc/hadoop/
COPY conf/hbase-site.xml $HBASE_HOME/conf/
COPY conf/regionservers $HBASE_HOME/conf/

EXPOSE 8088 8020 50070 8042 2181 16010

ENTRYPOINT sed -i "s/{{HOST}}/`hostname`/g" $HADOOP_HOME/etc/hadoop/core-site.xml \
            && sed -i "s/{{HOST}}/`hostname`/g" $HBASE_HOME/conf/hbase-site.xml \
            && sed -i "s/{{HOST}}/`hostname`/g" $HBASE_HOME/conf/regionservers \
            && service ssh start && hdfs namenode -format && start-dfs.sh && start-yarn.sh && start-hbase.sh && tail -f /dev/null