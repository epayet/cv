FROM debian:stable-slim

ENV LANG C.UTF-8

# Install Pandoc, Make, full TeXLive, and the specific 'moderncv' package
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        make \
        pandoc \
        texlive-full \
        texlive-publishers \
        ttf-mscorefonts-installer \
        dia \
        gnumeric \
        inkscape \
        biber \
        file \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /source
CMD make