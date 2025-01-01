FROM nginx:1.20

COPY . /usr/share/nginx/html/

#RUN echo "This is Gaurav" > /gauravfile.txt

EXPOSE 80

