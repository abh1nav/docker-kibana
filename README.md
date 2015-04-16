# DevDB Elasticsearch + Kibana

Elasticsearch 1.5.1 + Kibana 4.0.2 in a docker container for a fast throwaway environment.

# Quickstart

Use this if you don't care about Elasticsearch data persisting across container destroy/restart/etc.

```
docker pull devdb/kibana:latest
docker run -d --name kibana -p 5601:5601 -p 9200:9200 devdb/kibana
```

You can create an index and mappings using:

```
curl -XPUT http://localhost:9200/twitter
curl -XPUT http://localhost:9200/twitter/_mapping/tweet -d '{
   "tweet" : {
     "properties": {
         "text": { "type": "string" },
         "user_id": { "type": "string", "index": "not_analyzed" }
     }
   }
}'
```

Then, you can point your browser to `http://localhost:5601` and the Kibana4 dashboard will come up.

**Warning**: The data in Elasticsearch is lost when the container is destroyed. If you want the data to persist, then use:

```
docker pull devdb/kibana:latest
docker run -d --name kibana -p 5601:5601 -p 9200:9200 -v /tmp/kibana:/opt/elasticsearch/data devdb/kibana
```

where `/tmp/kibana` is where the data files are stored on your host machine.
