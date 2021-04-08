FROM nginx:1.12-alpine

COPY default.conf /etc/nginx/conf.d

EXPOSE 80

RUN apk update && \
    apk add --no-cache tzdata

ENV TZ Asia/Taipei
RUN echo "Asia/Taipei" > /etc/timezone

# Run the nginx server
CMD ["nginx", "-g", "daemon off;"]