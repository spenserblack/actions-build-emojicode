FROM ubuntu:20.04

# Setup emojicodec
WORKDIR /emojicodec/app
RUN apt update \
  && apt install g++ libncurses5 wget -y \
  && wget https://github.com/emojicode/emojicode/releases/download/v1.0-beta.2/Emojicode-1.0-beta.2-Linux-x86_64.tar.gz \
  && tar -xzf Emojicode-1.0-beta.2-Linux-x86_64.tar.gz \
  && rm Emojicode-1.0-beta.2-Linux-x86_64.tar.gz \
  && cp ./Emojicode-1.0-beta.2-Linux-x86_64/emojicodec /usr/bin/ \
  && chmod +x /usr/bin/emojicodec \
  && mv ./Emojicode-1.0-beta.2-Linux-x86_64/packages /usr/local/EmojicodePackages \
  && mkdir -p /usr/local/include \
  && mv ./Emojicode-1.0-beta.2-Linux-x86_64/include /usr/local/include/emojicode \
  && rm -rf Emojicode-1.0-beta.2-Linux-x86_64/ \
  && apt remove wget -y

# Access user's repo
WORKDIR /github/workspace

ENTRYPOINT ["/usr/bin/emojicodec"]
