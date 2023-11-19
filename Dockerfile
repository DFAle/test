FROM node:18.16.1-alpine as build-step

RUN mkdir -p /app

WORkDIR /app 

copy package.json /app

RUN npm install 

COPY . /app 

RUN npm run build --prod 

#segundo paso

FROM nginx:1.17.10-alpine

COPY --from=build-step /app/dist/Angular/ /usr/share/nginx/html