FROM node:18.16.1-alpine as build-step

RUN mkdir -p /app

WORkDIR /app 

copy package.json /app

RUN npm install 

COPY . /app 

RUN npm run build --prod 

#segundo paso

FROM Debian:11

COPY --from=build-step /app/dist/Angular/ /var/www/html/
CMD ["debian", "-g", "daemon off;"]