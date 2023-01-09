FROM debian:buster

RUN apt update -y
RUN apt install lsb-release -y \
    && apt install curl -y \
    && apt install gpg -y

RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" |  tee /etc/apt/sources.list.d/redis.list \ 
    && apt update -y && apt install redis -y

#COPY ./conf/redis.conf /etc/redis/redis.confre

CMD ["redis-server", "--protected-mode", "no"]