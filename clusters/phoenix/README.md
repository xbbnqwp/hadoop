# Running 2 clusters  

```
cd clusters/phoenix
docker-compose up -d --build
```
1. There will be two containers that will start `pnx_cluster_1` and `pnx_cluster_2`.
2. Both the containers will have `Hadoop-2.6.4`, `Hbase-1.3.1` and `Phonix-4.14.0` installed and configured.
3. Both the clusters will be able to do ssh to each other since they share same ssh keys.

So, you can login to any of the containers using the following command
```
docker exec -it pnx_cluster_1 bash
docker exec -it pnx_cluster_2 bash
```

This is configured to run two single node clusters on docker with static ip's and hostnames as follows
1. `172.25.0.101` - `hdp1.hw.com`
2. `172.25.0.102` - `hdp2.hw.com`


Following services are available at the following url's.

| Service | Cluster 1 | Cluster 2
| --- | --- | --- |
| Resource Manager | [http://localhost:8088/cluster](http://localhost:8088/cluster) | [http://localhost:8089/cluster](http://localhost:8089/cluster) |
| Node Manager | [http://localhost:50070/](http://localhost:50070/)|[http://localhost:50071/](http://localhost:50071/) |
| Hbase UI | [http://localhost:16010/](http://localhost:16010/)|[http://localhost:16011/](http://localhost:16011/) |
| Log manager | [http://localhost:8042](http://localhost:8042)|[http://localhost:8043](http://localhost:8043) |




Copy data to hdfs
```
echo "Hello Wolrd" > hello.txt
hdfs dfs fs -put hello.txt /
```

See data in hdfs
```
hdfs dfs -ls /
# see data on cluster 1
hdfs dfs -ls hdfs://hdp1.hw.com:8020/ 
# see data on cluster 2
hdfs dfs -ls hdfs://hdp2.hw.com:8020/ 
```

Copy data from Cluster-1 to Cluster-2 using distcp
 ```
 hadoop distcp hdfs://hdp1.hw.com:8020/hello.txt hdfs://hdp2.hw.com:8020/
 ```
Stop both clusters
```
docker-compose down
```
