FROM golang:1.20-bullseye as builder

WORKDIR /app

COPY . /app/

RUN go build -o main .

FROM debian:bullseye

ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

COPY --from=builder /app/main /app/

EXPOSE 8080

CMD ["/app/main"]
