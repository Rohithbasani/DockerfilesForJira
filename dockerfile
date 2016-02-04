FROM ubuntu:14.04
MAINTAINER Rohith Basani <r.basani@bssn-software.eu>
RUN mkdir ~/jirasetup
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get clean
WORKDIR /tmp
COPY response.varfile /tmp/
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-5.1.7-x64.bin
RUN chmod 700 atlassian-jira-5.1.7-x64.bin
RUN mkdir /jira 
EXPOSE 8080
#ADD ./response.varfile response.varfile
#RUN chmod 700 /opt/atlassian/jira/bin/catalina.sh 
RUN /tmp/atlassian-jira-5.1.7-x64.bin -q -varfile response.varfile
RUN rm /tmp/atlassian-jira-5.1.7-x64.bin
RUN rm /tmp/response.varfile
CMD /opt/atlassian/jira/bin/start-jira.sh -fg

