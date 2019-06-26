FROM tomcat:8-jdk8-adoptopenjdk-hotspot

MAINTAINER Sivaprakash Ramasamy <sivaprakash123@gmail.com>

RUN apt-get update && apt-get install -y wget

## comment this line if the artifact is not exist or different location ID in the Google drive ##
RUN rm -rf /usr/local/tomcat/webapps/ROOT && wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=19jBS4KLo0kOs4R32DsPtIFfUs_UJZaGb' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=19jBS4KLo0kOs4R32DsPtIFfUs_UJZaGb" -O /usr/local/tomcat/webapps/ROOT.war && rm -rf /tmp/cookies.txt 

#### Uncomment the below lines if this artificat is in the current location ###
# RUN rm -rf /usr/local/tomcat/webapps/ROOT
# ADD companyNews.war /usr/local/tomcat/webapps/ROOT.war

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
