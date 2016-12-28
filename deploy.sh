#!/bin/bash

# git update repo
git pull origin master

# bash into the staging docker containers
# remove the current pdf folders
# replace them  with the one in this repo

#docker_containers=(datahub-staging-app datahub) #array
docker_containers=(datahub-staging-app) #array
for i in "${docker_containers[@]}"
do
  docker exec ${docker_containers[i]} rm -rf /src/public/pdf/** #remove pdf folder content
  docker cp -a ~/pdf-print/** ${docker_containers[i]}:/src/public/pdf/ #copy into pdf folder
done

