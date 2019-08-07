FROM gone/php:cli
COPY email-deleter.runit /etc/service/email-deleter/run
HEALTHCHECK --interval=5s --timeout=3s \
    CMD ps aux | grep -v grep | grep email-deleter
