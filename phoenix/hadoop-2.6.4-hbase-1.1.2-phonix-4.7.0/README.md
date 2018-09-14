# About Image

Following are the properties about the image
1. Build on `ekiras/hbase:hadoop-2.6.4-hbase-1.3.1`
2. Hadoop, Hbase and phoenix are in `/opt/` directory
3. Java home is `/usr/lib/jvm/java-8-openjdk-amd64`
4. Hostname for hadoop is `localhost` and running on port `8020`, and is working in pseudo-distributed installation. 

# Configurations
* Hadoop - 2.6.4
* Hbase - 1.1.2
* Phoenix - 4.14.0

# Download Hbase image
```Dockerfile
docker pull ekiras/phoenix:hdp-2.6.4-hbase-1.1.2-phoenix-4.7.0
```

# Run Hbase docker container
Use the following command to run docker container
```Dockerfile
docker run -itd --name phoenix -p50070:50070 -p8042:8042 -p8088:8088 -p16000:16000 -p16010:16010 -p16020:16020 -p9095:9095 -p8085:8085 -p2181:2181 ekiras/phoenix:hdp-2.6.4-hbase-1.1.2-phoenix-4.7.0
```

# Web services available
Following services can be accessed on following urls

| Service | Url |
| --- | --- |
| Resource Manager | [http://localhost:8088/cluster](http://localhost:8088/cluster) |
| DFS Health | [http://localhost:50070/dfshealth.html](http://localhost:50070/dfshealth.html)|
| Log Manager| [http://localhost:8042/node](http://localhost:8042/node)|
| Hbase UI  | [http://localhost:16010/](http://localhost:16010/) |



