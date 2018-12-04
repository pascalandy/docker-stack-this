FROM golang:1.8.0 AS builder
LABEL maintainer mlabouardy
WORKDIR /go/src/github.com/mlabouardy/movies-api/
COPY app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /go/src/github.com/mlabouardy/movies-api/app .
EXPOSE 5000
CMD ["./app"]
