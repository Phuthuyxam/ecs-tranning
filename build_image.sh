#!/bin/sh

docker rm --force ecs_study

docker build -t ecs_study_image:latest -f docker/Dockerfile .

docker run --privileged -ti -d -p 9000:80 --name ecs_study ecs_study_image:latest   

