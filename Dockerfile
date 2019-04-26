#setup java
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y install software-properties-common 
RUN apt install apt-utils -y
RUN apt-get install default-jdk -y


Run apt install net-tools vim  -y


#setup tomcat 
RUN apt install wget -y
RUN apt install tar -y
workdir  /opt/tomcat
RUN wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz -P  /opt/tomcat
RUN tar xvzf /opt/tomcat/apache-tomcat-8.*.tar.gz
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64"  >> /root/.bashrc
RUN echo "export CATALINA_HOME=/opt/tomcat/apache-tomcat-8.5.40" >> /root/.bashrc
RUn echo "/opt/tomcat/apache-tomcat-8.5.40/bin/startup.sh" >> /root/.bashrc
RUN chmod 777 /root/.bashrc
WORKDIR  ~
RUN . ~/.bashrc

#Maven Setup
RUN apt-get update
RUN apt install maven -y


