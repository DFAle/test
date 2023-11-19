FROM node:18.16.1 AS build-step

RUN mkdir -p /app

WORkDIR /app 

copy package.json /app

RUN npm install 

COPY . /app 

RUN npm run build --prod 

#segundo paso

FROM debian:11

COPY --from=build-step /app/dist/angular/ /var/www/html/
CMD ["debian", "-g", "daemon off;"]