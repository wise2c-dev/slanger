FROM ruby:2.3.0

RUN gem install slanger && mkdir /app/ 

ADD ./config.template /app/
WORKDIR /app/
RUN eval "echo \"$(cat /app/config.template)\""  > /app/config.yml

EXPOSE 4567
EXPOSE 8088

CMD slanger -C /app/config.yml -v


