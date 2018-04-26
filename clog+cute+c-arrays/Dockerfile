FROM debian:latest

RUN apt-get update -qq && apt-get install -qq clang gcc git make

COPY ./install_deps.sh .
COPY ./dependencies.txt .

RUN ./install_deps.sh dependencies.txt
