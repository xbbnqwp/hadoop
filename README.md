# Running 2 hadoop clusters  

```
cd clusters
docker-compose up -d
```
This is configured to run two single node clusters on docker with static ip's and hostnames as follows
1. `172.25.0.101` - `hdp1.hw.com`
2. `172.25.0.102` - `hdp2.hw.com`

Following ports are exposed to the host
1. cluster-1 - `(8088:hadoop, 50070:dfshealth)`
2. cluster-2 - `(8089:hadoop, 50071:dfshealth)`

Check distcp between these 2 clusters
 ```
 hadoop distcp hdfs://hdp1.hw.com:8020/file.txt hdfs://hdp2.hw.com:8020/
 ```


