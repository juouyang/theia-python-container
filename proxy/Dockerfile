FROM nginx:1.12-alpine

COPY default.conf /etc/nginx/conf.d

EXPOSE 80

# Run the nginx server
CMD ["nginx", "-g", "daemon off;"]