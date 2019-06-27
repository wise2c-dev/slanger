FROM antillion/slanger:0.6.0

RUN mkdir /app/ 

ADD ./config.template /app/
WORKDIR /app/

EXPOSE 4567
EXPOSE 8088

# CMD eval "echo \"$(cat /app/config.template)\""  > /app/config.yml \
#  && slanger -C /app/config.yml -w 0.0.0.0:8088 -v
CMD slanger -w 0.0.0.0:8088 -k $PUSHER_APPKEY -s $PUSHER_SECRET -r redis://wise2c:${REDIS_PWD}@${REDIS_URL}:${REDIS_PORT}/1 -v

