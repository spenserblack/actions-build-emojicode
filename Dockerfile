FROM ubuntu:20.04

# Setup emojicodec
RUN apt update
RUN apt install g++ libncurses5 -y
RUN mkdir /Downloads
ADD https://github.com/emojicode/emojicode/releases/download/v1.0-beta.2/Emojicode-1.0-beta.2-Linux-x86_64.tar.gz /Downloads
WORKDIR /Downloads
RUN tar -xzf Emojicode-1.0-beta.2-Linux-x86_64.tar.gz
RUN cp ./Emojicode-1.0-beta.2-Linux-x86_64/emojicodec /usr/bin/
RUN chmod +x /usr/bin/emojicodec
RUN mv ./Emojicode-1.0-beta.2-Linux-x86_64/packages /usr/local/EmojicodePackages
RUN mkdir -p /usr/local/include
RUN mv ./Emojicode-1.0-beta.2-Linux-x86_64/include /usr/local/include/emojicode

# Access user's repo
WORKDIR /github/workspace

ENTRYPOINT ["/usr/bin/emojicodec"]
