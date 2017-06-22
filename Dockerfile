FROM ubuntu:16.04
MAINTAINER Evgeniy N. Ozhiganov <eozhiganov@ya.ru>

RUN apt-get update && apt-get install -y git build-essential cmake libcurl4-openssl-dev

RUN git clone https://github.com/xmrig/xmrig.git

RUN mkdir xmrig/build

WORKDIR xmrig/build

RUN cmake .. -DCMAKE_BUILD_TYPE=Release

RUN make

ENV POOL stratum+tcp://xmrpool.tk:5555
ENV USERNAME 427Efoae2zP5XvsT8CXMWCg7ZYr9TzrZHauUtzUiEY7F27XhMpWSvLy7s5LHE3MAwhGE8U3yxGkXARfwHFEVYXiLAat3GYy
ENV DONATE 5
ENV THREADS 4

CMD ./xmrig -o $POOL -u $USERNAME -p x -k --donate-level=$DONATE -t $THREADS
