FROM golang:1.20-alpine3.17 as builder

# RUN apk add build-base

WORKDIR /app

COPY . /app/

# RUN GOOS=linux go build -tags musl -o main .
RUN GOOS=linux go build -o main .

FROM alpine:3.17

# ENV TZ Asia/Shanghai
# RUN apk add tzdata && cp /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# RUN apk add ca-certificates

WORKDIR /app

COPY --from=builder /app/main /app/

EXPOSE 8080

CMD ["/app/main"]
