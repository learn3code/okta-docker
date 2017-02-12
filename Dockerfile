FROM alpine:3.3

RUN apk update && apk upgrade

RUN apk add nodejs git make g++ jpeg tiff

RUN git clone https://github.com/learn3code/okta-express

RUN wget http://dl.maptools.org/dl/libtiff/tiff-3.8.2.tar.gz

RUN tar zxvf tiff-3.8.2.tar.gz

RUN cd /tiff-3.8.2 && ./configure --disable-zlib --disable-jpeg --disable-pixarlog && make && make install

WORKDIR /okta-express

RUN cd /okta-express && npm install && unzip public/pdfjs-1.6.210-dist.zip -d public && mkdir -p uploads/pdf uploads/other tmp data

EXPOSE 3000:3000

CMD ["npm", "start"]

