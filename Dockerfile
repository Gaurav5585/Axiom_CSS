FROM nginx:alpine

COPY . index.html 

#RUN echo "This is Gaurav" > /gauravfile.txt

EXPOSE 80

