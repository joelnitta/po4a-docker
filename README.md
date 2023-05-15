# README

A [docker image](https://hub.docker.com/r/joelnitta/po4a) for running [po4a](https://po4a.org/)

## Tags

[Tags](https://hub.docker.com/r/joelnitta/po4a/tags) track po4a [releases](https://github.com/mquinson/po4a/releases).

The `latest` tag is the most recent development version (at the time of building the image) cloned from [github](https://github.com/mquinson/po4a).

There is one branch per tag (e.g., [0.67](https://github.com/joelnitta/po4a-docker/tree/0.67)). `main` tracks `latest`.

The tag for the arm64 build (`joelnitta/po4a-arm64:latest`) should be built by including the flag `--platform linux/arm64` in the `docker build` call, i.e., `docker build --platform linux/arm64 . -t joelnitta/po4a-arm64:latest`.

## License

[MIT](LICENSE)