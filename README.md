# DevDB Elasticsearch + Kibana

Elasticsearch 1.4.1 + Kibana 4.0.0-BETA2 in a docker container for a fast throwaway environment.

# Quickstart

Use this if you don't care about Elasticsearch data persisting across container destroy/restart/etc.

```
docker pull devdb/kibana:latest
docker run -d --name kibana -p 5601:5601 devdb/kibana
```

Note: The data in Elasticsearch is lost when the container is destroyed. If you want the data to persist, then use:

```
docker pull devdb/kibana:latest
docker run -d --name kibana -p 5601:5601 -v /tmp/kibana:/opt/elasticsearch/data devdb/kibana
```

where `/tmp/kibana` is where the data files are stored on your host machine.