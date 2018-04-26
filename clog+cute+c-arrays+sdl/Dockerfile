FROM debian

# Dependencies are automatically resolved and installed.
RUN apt-get update -qq && \
    apt-get install -qq clang gcc git make libsdl2-dev libsdl2-ttf-dev

COPY ./install_deps.sh .
COPY ./dependencies.txt .

RUN ./install_deps.sh dependencies.txt
