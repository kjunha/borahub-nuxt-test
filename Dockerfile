FROM node:alpine
WORKDIR /usr/src/app
RUN apk update
RUN apk add nginx
RUN mkdir -p /run/nginx
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY package*.json ./
RUN npm install
COPY . .
# ENV NUXT_HOST=0.0.0.0
EXPOSE 3000
RUN npm run generate
CMD npm run start && nginx -g 'daemon off;'