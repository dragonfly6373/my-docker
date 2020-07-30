#!/bin/sh

HOME=`pwd`

docker run -u 0 -it --rm \
	-p 9080:80 -p 5000:5000 \
        -v $HOME/jenkins_home:/var/jenkins_home \
	--network net-web \
	--name MyJenkin \
	jenkins

