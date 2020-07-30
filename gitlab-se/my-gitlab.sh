#!/bin/sh

cd `dirname $0`
HOME=`pwd`

docker run -u 0 -it \
	-p 9080:80 -p 9022:22 -p 9443:443 -p 9587:587 \
	-v $HOME/srv/config:/etc/gitlab \
	-v $HOME/srv/logs:/var/log/gitlab \
	-v $HOME/srv/data:/var/opt/gitlab \
	--name gitlab-local \
	--hostname 'gitlab.local.com' \
	gitlab/gitlab-ce:latest

