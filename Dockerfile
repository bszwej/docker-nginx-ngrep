FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx-template.conf

RUN apk update && apk upgrade && apk add bash ngrep curl dumb-init

CMD ["/usr/bin/dumb-init", "--",                                                                    \
     "bash", "-c",                                                                                  \
     "envsubst < /etc/nginx/nginx-template.conf > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]

