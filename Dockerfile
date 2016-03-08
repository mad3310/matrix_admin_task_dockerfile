FROM 10.160.140.32:5000/letv-jetty-base-ip:0.0.1
MAINTAINER lisuxiao <lisuxiao@letv.com>

RUN yum install java-1.7.0-openjdk-devel.x86_64 -y
RUN yum install openssl nss -y
RUN rm -f /opt/letv/jetty/contexts/test.xml
RUN yum install dejavu* -y

USER root

ADD ./file/webportal-webadmin.war /opt/letv/jetty/webapps/webportal-webadmin.war
ADD ./file/webportal-webadmin.xml /opt/letv/jetty/contexts/webportal-webadmin.xml
ADD ./file/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar /opt/letv/jetty/lib/ext/jetty-nosql-memcached-0.3.0-jar-with-dependencies.jar
ADD ./file/jettyadmin.xml /opt/letv/jetty/etc/jetty.xml
ADD ./file/jetty-web.xml /opt/letv/jetty/jetty-web.xml



ENTRYPOINT bash /root/init_net.sh && service jetty-manager restart && /salt_minion_init.sh  && service moxi-manager start && service gbalancer-manager start && /opt/letv/init.sh && /bin/bash


