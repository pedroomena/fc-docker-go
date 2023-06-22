FROM golang:1.20.5-alpine AS builder

WORKDIR /app

COPY ./hello.go .

RUN go mod init hello && \
    go build hello.go

FROM scratch AS runtime

COPY --from=builder /app/hello .

CMD ["/hello"]
