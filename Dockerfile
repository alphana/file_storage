FROM nginx:alpine
RUN mkdir -p store/static
WORKDIR /store
COPY static static/.
COPY ./nginx.conf /etc/nginx/nginx.conf
