FROM razorpay/containers:app-nginx

ENV OAUTH2_PROXY_VERSION="2.1"
ENV OAUTH2_PROXY_PKG="oauth2_proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.go1.6" \
    OAUTH2_PROXY_SHA="3061e5b04bd14eeb9ec0ad1c9b324ba8d99d50eaadc5f528cdf4d21043828298"

COPY conf /app/conf

RUN mkdir -p /var/tmp/oauth2_proxy && \
   cd /var/tmp/oauth2_proxy && \
   wget https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_VERSION}/${OAUTH2_PROXY_PKG}.tar.gz && \
   echo "${OAUTH2_PROXY_SHA} *${OAUTH2_PROXY_PKG}.tar.gz" | sha256sum -c - && \
   tar xvf ${OAUTH2_PROXY_PKG}.tar.gz && \
   cp -v /var/tmp/oauth2_proxy/${OAUTH2_PROXY_PKG}/oauth2_proxy /usr/local/bin/ && \
   mkdir -p /etc/oauth2proxy && \
   apk del $BUILD_PKGS && \
   rm -rf /var/cache/apk/*

 COPY ./entrypoint.sh .

 CMD ["/bin/sh", "./entrypoint.sh"]
