FROM antillion/slanger:0.6.0

RUN mkdir /app/ 

ADD ./config.template /app/
WORKDIR /app/

EXPOSE 4567
EXPOSE 8088

# mode 1
# CMD eval "echo \"$(cat /app/config.template)\""  > /app/config.yml \
#  && slanger -C /app/config.yml -w 0.0.0.0:8088 -v

# mode 2
# CMD slanger -w 0.0.0.0:8088 -k $PUSHER_APPKEY -s $PUSHER_SECRET -r redis://wise2c:${REDIS_PWD}@${REDIS_URL}:${REDIS_PORT}/1 -v

# mode 3
CMD slanger --websocket_host=0.0.0.0:8088 --app_key=$PUSHER_APPKEY --secret=$PUSHER_SECRET --redis_address=redis://wise2c:${REDIS_PWD}@${REDIS_URL}:${REDIS_PORT}/1 -v
