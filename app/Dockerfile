FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download || true

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o app ./cmd
FROM scratch

COPY --from=builder /app/app .

EXPOSE 8080

CMD ["./app"]


  