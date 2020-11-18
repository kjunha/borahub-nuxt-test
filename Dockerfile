FROM node:alpine
WORKDIR /var/www/html
RUN apk update && \
        apk add nginx supervisor && \
        mkdir -p /run/nginx

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY . .

# ENV NUXT_HOST=0.0.0.0
EXPOSE 80

ENTRYPOINT ["./bootstrap.sh"]