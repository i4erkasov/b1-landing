FROM golang:latest

ENV APP_NAME app
ENV PORT 8080

ARG UID
ARG GID

WORKDIR /go/src/${APP_NAME}

RUN mkdir vendor
#sudo chmod a+wx Gopkg.*

COPY . .

# Go dep!
RUN go get -u github.com/golang/dep/cmd/dep

RUN go get ./
RUN go build -o ${APP_NAME}

RUN usermod -u $UID www-data \
    && groupmod -g $GID www-data

USER www-data

CMD ["app"]

EXPOSE ${PORT}