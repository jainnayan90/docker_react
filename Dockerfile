################# Build Phase ##############
FROM node:16-alpine as builder

WORKDIR /usr/app

COPY package.json /usr/app/
RUN npm install

COPY . /usr/app/

RUN npm run build

################# PROD Phase ##############
FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html    