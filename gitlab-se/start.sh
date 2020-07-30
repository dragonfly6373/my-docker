#!/bin/sh

cd `dirname $0`
export HOME=`pwd`
GITHOME=$HOME docker-compose up -d

