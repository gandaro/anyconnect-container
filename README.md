# Docker image for ocproxy

This Docker image can be used to run [OpenConnect](https://www.infradead.org/openconnect/) and a SOCKS5 proxy (on port 1080) that forwards traffic to OpenConnect. The SOCKS5 proxy is [`ocproxy`](https://github.com/cernekee/ocproxy).

## Usage

This Docker image has been tested with [Apple's `container`](https://github.com/apple/container) command on macOS 15.

	container system start
	container build -c 1 -t anyconnect-proxy
	container run --rm anyconnect-proxy -C WEBVPN_COOKIE COOKIE_DOMAIN

`WEBVPN_COOKIE` can be obtained by opening the VPN domain in any browser, entering your credentials, and reading out the `webvpn` cookie that has been set in the process. The `COOKIE_DOMAIN` is the domain on which the cookie has been set (the domain that you are being forwarded to after opening the base domain in your browser).

By running `container ls` you can find out the IP address of the container. The IP address in conjunction with the port 1080 is what you need to configure your OS or other software to use the proxy.

Apparently it is required to let the proxy server handle hostname resolution. As of the time of writing, when setting the proxy server in the macOS system settings, the proxy server works in Safari, but not in Firefox (version 143). When using `curl`, you need to use the `--socks5-hostname` argument or a `socks5h://` URI.
