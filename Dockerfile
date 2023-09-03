FROM golang:1.21-bookworm as builder

WORKDIR /app

COPY . /app/

RUN go build -o main .

FROM debian:bookworm

WORKDIR /app

COPY --from=builder /app/main /app/

EXPOSE 8080

CMD ["/app/main"]
