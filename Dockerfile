
FROM alpine:latest

WORKDIR /app

COPY cosmos-validators-exporter /app/
COPY config.toml /app/config.toml

EXPOSE 9565

CMD ["./cosmos-validators-exporter", "--config", "/app/config.toml"]
