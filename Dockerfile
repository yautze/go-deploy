# Build Stage 
FROM golang:latest AS build

COPY . /app
WORKDIR /app

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app 

# Final Stage 
FROM alpine:latest  
COPY --from=build /app/app /app

WORKDIR /
ENTRYPOINT ["./app"]
CMD ["version"]

