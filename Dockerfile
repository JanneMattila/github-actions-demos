FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY test-db.sh /app/test-db.sh

RUN chmod +x /app/test-db.sh

CMD ["/app/test-db.sh"]
