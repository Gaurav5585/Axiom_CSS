FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN echo "This is Gaurav" > /gauravfile.txt

EXPOSE 80

