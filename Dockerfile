FROM alpine:3

# Setup emojicodec
RUN wget https://github.com/emojicode/emojicode/releases/download/v1.0-beta.2/Emojicode-1.0-beta.2-Linux-x86_64.tar.gz -O emojicode.tar.gz
RUN tar -xzf emojicode.tar.gz
RUN mv ./Emojicode-1.0-beta.2-Linux-x86_64/emojicodec /usr/local/bin
RUN chmod +x /usr/local/bin/emojicodec
RUN mv ./Emojicode-1.0-beta.2-Linux-x86_64/packages /usr/local/EmojicodePackages
RUN mkdir -p /usr/local/include
RUN mv ./Emojicode-1.0-beta.2-Linux-x86_64/include /usr/local/include/emojicode

# Access user's repo
WORKDIR /github/workspace

ENTRYPOINT ["/usr/local/bin/emojicodec"]
