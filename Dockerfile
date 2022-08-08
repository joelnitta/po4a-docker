FROM debian:bullseye-slim

LABEL org.opencontainers.image.authors="Joel Nitta joelnitta@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y --no-install-recommends po4a && \
	apt-get clean
