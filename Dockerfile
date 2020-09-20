FROM golang
WORKDIR /go/src/cat-server
COPY cat-server.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

FROM alpine:latest
WORKDIR /root/
COPY --from=0 /go/src/cat-server/cat-server .
COPY images images
EXPOSE 8080
CMD ["./cat-server"]
