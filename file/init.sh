#!/bin/bash
cd /opt/letv/jetty/webapps/
mkdir webportal-webadmin
cd webportal-webadmin

jar -xvf /opt/letv/jetty/webapps/webportal-webadmin.war
cp /opt/letv/jetty/jetty-web.xml /opt/letv/jetty/webapps/webportal-webadmin/WEB-INF/
rm -rf /opt/letv/jetty/webapps/webportal-webadmin.war

service gbalancer start
service jetty start

