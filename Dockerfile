FROM golang:1.18.3-alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go

FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8080

ENTRYPOINT [ "/main" ]