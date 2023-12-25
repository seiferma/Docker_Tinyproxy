FROM alpine:latest
ARG VERSION=

# Setup dependencies
RUN apk add --no-cache su-exec tinyproxy=$VERSION && \
    rm /etc/tinyproxy/tinyproxy.conf

# Add start script
COPY start.sh /

# Start the server
ENTRYPOINT ["./start.sh"]
CMD ["default"]
