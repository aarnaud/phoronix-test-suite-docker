FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && apt-get install -y wget php-sqlite3 php-zip
RUN wget https://github.com/phoronix-test-suite/phoronix-test-suite/releases/download/v10.8.4/phoronix-test-suite_10.8.4_all.deb
RUN apt-get install -f ./phoronix-test-suite_10.8.4_all.deb -y && rm phoronix-test-suite_10.8.4_all.deb
RUN /usr/bin/phoronix-test-suite make-openbenchmarking-cache lean
RUN /usr/bin/phoronix-test-suite make-download-cache
RUN rm -f /var/lib/phoronix-test-suite/core.pt2so