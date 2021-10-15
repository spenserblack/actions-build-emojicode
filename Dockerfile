FROM archlinux:latest

# Setup emojicodec
RUN git clone https://aur.archlinux.org/emojicode.git /emojicode
WORKDIR /emojicode
RUN makepkg -i

COPY entrypoint.sh /entrypoint.sh

# Access user's repo
WORKDIR /github/workspace

ENTRYPOINT ["/entrypoint.sh"]
