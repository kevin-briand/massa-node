FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

ARG massaVersion=MAIN.5.0

WORKDIR /node

RUN curl -OLf https://github.com/massalabs/massa/releases/download/${massaVersion}/massa_${massaVersion}_release_linux.tar.gz  \
    && tar -xzvf massa_${massaVersion}_release_linux.tar.gz  \
    && rm massa_${massaVersion}_release_linux.tar.gz

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

RUN useradd --system --shell /usr/sbin/nologin massa && chown -R massa massa
USER massa

EXPOSE 31244 31245
ENTRYPOINT ["./entrypoint.sh"]