FROM nginx:1.17.0-alpine
MAINTAINER Sivaprakash Ramasamy <sivaprakash123@gmail.com>

RUN apk --update add unzip wget openssl
    
## comment this line if the artifact is not exist or different location ID in the Google drive ##
RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1UiuPXRWf5hfvSyxIeArjYHwopC8-cYJM' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1UiuPXRWf5hfvSyxIeArjYHwopC8-cYJM" -O /tmp/static.zip && rm -rf /tmp/cookies.txt

#### Uncomment the below lines if this artificat is in the current location ###
# ADD static.zip /tmp/static.zip


RUN unzip -d /usr/share/nginx/html/ /tmp/static.zip \
    && rm -rf /tmp/static.zip
RUN openssl req -x509 -nodes -newkey rsa:2048  -keyout localhost.key -out localhost.crt -days 365 -subj "/C=IN/ST=Karnataka/L=Bangalore/O=Company Name/OU=Org/CN=localhost" && mv localhost.* /etc/ssl/
COPY default.conf /etc/nginx/conf.d/default.conf
