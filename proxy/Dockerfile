FROM nginx:1.12-alpine

# Timezone
ENV TIMEZONE Asia/Taipei

RUN	apk update && \
	apk upgrade && \
	apk add --update openssl nginx && \
	apk add --update tzdata && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
	echo "${TIMEZONE}" > /etc/timezone && \
    mkdir /etc/nginx/certificates && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

COPY ssl/dev.net.key /etc/nginx/certificates/key.pem
COPY ssl/dev.net.crt /etc/nginx/certificates/cert.pem
COPY default.conf /etc/nginx/conf.d
COPY ssl.conf /etc/nginx/conf.d
COPY common.conf /etc/nginx

# Expose ports
EXPOSE 80 443

# Entry point
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]