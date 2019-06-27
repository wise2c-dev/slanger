FROM ruby:2.2.0

RUN gem install slanger -v 0.6.0 && mkdir /app/ 

ADD ./config.template /app/
WORKDIR /app/

EXPOSE 4567
EXPOSE 8088

CMD eval "echo \"$(cat /app/config.template)\""  > /app/config.yml \
 && slanger -C /app/config.yml -w websocket_host 0.0.0.0:8088 -v


