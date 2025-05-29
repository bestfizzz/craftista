# === Stage 1: Dependency resolution ===
FROM golang:1.20-alpine AS deps
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

# === Stage 2: Run tests ===
FROM deps AS test
COPY . .
RUN go test -v ./...

# === Stage 3: Build binary ===
FROM deps AS build
COPY . .
RUN go build -o app

# === Stage 4: Final image ===
FROM build AS final
WORKDIR /app

COPY --from=build /app/app .
COPY --from=build /app/templates /app/templates
COPY --from=build /app/static /app/static
COPY --from=build /app/config.json /app/config.json

EXPOSE 8080
CMD ["./app"]
