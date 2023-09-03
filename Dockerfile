FROM golang:1.21-alpine as builder

WORKDIR /app

COPY . /app/

RUN go build -o main .

FROM alpine:3.18

WORKDIR /app

COPY --from=builder /app/main /app/

EXPOSE 8080

CMD ["/app/main"]
