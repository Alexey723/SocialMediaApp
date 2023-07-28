#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/id_rsa_alex \
    target/sweater-1.0-SNAPSHOT.jar \
    alex@192.168.1.114

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa_alex alex@192.168.1.114 << EOF

pgrep java | xargs kill -9
nohup java -jar sweater-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'