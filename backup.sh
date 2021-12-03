#!/bin/bash

sudo yum install -y aws-cli

now=$(date +"%m-%d-%Y")

sudo tar -zcvf neo4j_${now}.tar.gz /var/lib/docker/volumes/neo4j
sudo tar -zcvf "auth_${now}".tar.gz /var/lib/docker/volumes/postgres
sudo tar -zcvf "es_${now}".tar.gz /var/lib/docker/volumes/elasticsearch

aws s3 cp "neo4j_${now}".tar.gz s3://$BUCKET_NAME/
aws s3 cp "auth_${now}".tar.gz s3://$BUCKET_NAME/
aws s3 cp "es_${now}".tar.gz s3://$BUCKET_NAME/

rm -f "auth_${now}.tar.gz" "neo4j_${now}.tar.gz" "es_${now}.tar.gz" "mysql_${now}.tar.gz"
