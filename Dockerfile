FROM alpine:3

# Setup emojicodec
RUN mkdir /Downloads
ADD https://github.com/emojicode/emojicode/releases/download/v1.0-beta.2/Emojicode-1.0-beta.2-Linux-x86_64.tar.gz /Downloads
WORKDIR /Downloads
RUN ls -thl .
RUN tar -xzf Emojicode-1.0-beta.2-Linux-x86_64.tar.gz
RUN cp ./Emojicode-1.0-beta.2-Linux-x86_64/emojicodec /usr/bin/
RUN chmod +x /emojicodec
RUN mv ./Emojicode-1.0-beta.2-Linux-x86_64/packages /usr/local/EmojicodePackages
RUN mkdir -p /usr/local/include
RUN mv ./Emojicode-1.0-beta.2-Linux-x86_64/include /usr/local/include/emojicode

COPY entrypoint.sh /entrypoint.sh

# Access user's repo
WORKDIR /github/workspace

ENTRYPOINT ["/entrypoint.sh"]
