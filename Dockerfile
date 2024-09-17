FROM golang:1.19 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GODS=linux GOARCH=amd64 go build -o server

FROM scratch
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT [ "./server" ]