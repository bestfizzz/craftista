# === Stage 1: Dependency resolution ===
FROM golang:1.20-alpine AS deps
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .

# === Stage 2: Run tests ===
FROM deps AS test
RUN go test -v ./...

# === Stage 3: Build binary ===
FROM deps AS build
RUN go build -o app

# === Stage 4: Final image ===
FROM alpine:latest
WORKDIR /app

# Install required C libraries if any
RUN apk --no-cache add ca-certificates

COPY --from=build /app/app .
COPY --from=build /app/templates ./templates
COPY --from=build /app/static ./static
COPY --from=build /app/config.json ./config.json

EXPOSE 8080
ENTRYPOINT ["./app"]
