# Use official Golang image as the base for building the app
FROM golang:1.20-alpine as build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o app

# Use a minimal base image to run the compiled app
FROM alpine:latest
WORKDIR /app

# Copy app binary and necessary assets from build
COPY --from=build /app/app .
COPY --from=build /app/templates /app/templates
COPY --from=build /app/static /app/static
COPY --from=build /app/config.json /app/config.json
EXPOSE 8080
CMD ["./app"]
