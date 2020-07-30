# Webserver container with CGI python script
# Using RHEL 7 base image and Apache Web server
# Version 1

# Pull the rhel image from the local registry
FROM centos:latest
USER root

MAINTAINER nguyen.dang
RUN yum -y update
RUN yum -y install curl vim policycoreutils python3-policycoreutils
RUN yum -y install postfix
RUN systemctl enable postfix && systemctl start postfix
RUN curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
RUN yum -y install gitlab-ce

# Fix per https://bugzilla.redhat.com/show_bug.cgi?id=1192200
RUN yum -y install deltarpm yum-utils --disablerepo=*-eus-* --disablerepo=*-htb-* *-sjis-*\
    --disablerepo=*-ha-* --disablerepo=*-rt-* --disablerepo=*-lb-* --disablerepo=*-rs-* --disablerepo=*-sap-*

# Add configuration file
ADD gitlab.rb /etc/gitlab/gitlab.rb

RUN gitlab-ctl reconfigure
# RUN firewall-cmd --permanent --add-service={ssh,http,https} --permanent
# RUN firewall-cmd --reload

EXPOSE 80

# Start the service
# CMD mkdir /run/httpd ; /usr/sbin/httpd -D FOREGROUND
