FROM postgres:16

WORKDIR /app

COPY --chmod=755 test-db.sh /app/test-db.sh

CMD ["bash", "-c", "docker-entrypoint.sh postgres & pid=$!; /app/test-db.sh; status=$?; kill -TERM $pid; wait $pid || true; exit $status"]
