FROM nginx:latest

#COPY ./default.conf /etc/nginx/conf.d/
COPY ./templates/* /etc/nginx/templates/

ENV NGINX_HOST $DOCKER_NGINX_HOST

WORKDIR  /code

EXPOSE 80
