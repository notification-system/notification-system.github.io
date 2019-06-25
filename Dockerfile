FROM jekyll/jekyll:3.8 as build

COPY . /srv/jekyll

RUN jekyll build -d /tmp/public

FROM nginx:1.13-alpine

COPY --from=build /tmp/public/ /usr/share/nginx/html/
COPY nginx_default.conf /etc/nginx/conf.d/default.conf

