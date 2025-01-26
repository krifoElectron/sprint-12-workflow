FROM golang:1.21.5

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
COPY tracker.db ./

RUN go test
RUN go build -o main .

CMD ["./main"]
