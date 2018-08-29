# Running 2 hadoop clusters  

```
cd clusters
docker-compose up -d
```
There will be two containers that will start `hdp_cluster_1` and `hdp_cluster_1`
So, you can login to any of the containers using the following command
```
docker exec -it hdp_cluster_1 bash
docker exec -it hdp_cluster_2 bash
```

This is configured to run two single node clusters on docker with static ip's and hostnames as follows
1. `172.25.0.101` - `hdp1.hw.com`
2. `172.25.0.102` - `hdp2.hw.com`

Following ports are exposed to the host
1. cluster-1 - `(8088:hadoop, 50070:dfshealth)`
2. cluster-2 - `(8089:hadoop, 50071:dfshealth)`

Copy data to hdfs
```
echo "Hello Wolrd" > hello.txt
hadoop fs -put hello.txt /
```

See data in hdfs
```
hadoop fs -ls /
# see data on cluster 1
hadoop fs -ls hdfs://hdp1.hw.com:8020/ 
# see data on cluster 2
hadoop fs -ls hdfs://hdp2.hw.com:8020/ 
```

Copy data from Cluster-1 to Cluster-2 using distcp
 ```
 hadoop distcp hdfs://hdp1.hw.com:8020/hello.txt hdfs://hdp2.hw.com:8020/
 ```
Stop both clusters
```
docker-compose down
```
