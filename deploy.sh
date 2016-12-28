#!/bin/bash

# git update repo
git pull origin master -q

echo "finished updating pdf prints repo"
# bash into the staging docker containers
# remove the current pdf folders
# replace them  with the one in this repo

#docker_containers=(datahub-staging-app datahub) #array
docker_containers="datahub-staging-app" #array
for container in $docker_containers
do
  docker exec $container rm -rf /src/public/pdf/** #remove pdf folder content
  docker cp ~/pdf-prints/** $container:/src/public/pdf/ #copy into pdf folder
  echo "finished updating pdf folder for  $container"
done
