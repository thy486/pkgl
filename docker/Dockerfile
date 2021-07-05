FROM alpine:latest
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=C \
    SHELL=/bin/bash PS1="\u@\h:\w \$ " \
    PKGL_DIR=/pkgl
WORKDIR /pkgl
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f tzdata \
                             bash \
                             git \
                             nodejs \
                             openjdk11 \
                             npm \
                             nginx \
                             curl \
                             expect \
                             mysql \
                             mysql-client \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && npm install -g pm2 pnpm \
    && git clone -b master https://github.com/thy486/pkgl.git $PKGL_DIR \
    && cd vue-pkgl \
    && npm install \
    && rm -rf /root/.npm \
    && cd $PKGL_DIR/shell/MariaDB \
    && cp -f my.cnf  /etc/my.cnf \
    && bash startup.sh \
    && cp -f $PKGL_DIR/docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh \
    && chmod 777 /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
