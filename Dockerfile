FROM ruby:2.3.0

RUN gem install slanger

EXPOSE 4567
EXPOSE 8088

CMD slanger -w 0.0.0.0:8088 -k $PUSHER_APPKEY -s $PUSHER_SECRET -r redis://wise2c:$REDIS_PWD@$REDIS_URL:$REDIS_PORT/1 -v


