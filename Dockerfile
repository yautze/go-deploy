# Build Stage 

# Final Stage 
FROM golang:latest as binder
LABEL stage=builder

COPY . /api
WORKDIR /api
# Input the origin package path
RUN go build -o api

# 
FROM alpine:latest 
COPY --from=binder /api/api /api

WORKDIR /
ENTRYPOINT ["./api"]
CMD  ["version"]

