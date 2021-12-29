#!/bin/sh

docker rm --force ecs_study

docker build -t ecs_study_image:latest -f docker/Dockerfile .

docker run --rm --privileged=true -ti -d -p 9000:80 --name ecs_study ecs_study_image:latest /sbin/init

