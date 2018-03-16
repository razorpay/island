FROM runatlantis/atlantis
WORKDIR /usr/local/bin

RUN curl -O \
    https://github.com/sspinc/terraform-provider-credstash/releases/download/v0.2.1/terraform-provider-credstash_linux_amd64 \
 && chmod +x /usr/local/bin/terraform-provider-credstash_linux_amd64

 RUN curl -O \
    https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip \
&& unzip -o terraform_0.10.8_linux_amd64.zip \
&& chmod +x /usr/local/bin/terraform

ENV ALOHOMORA_VER="0.4.2"

ENV GOSU_VERSION 1.10
RUN set -ex; \
    \
    apk add --no-cache --virtual .gosu-deps \
    dpkg \
    gnupg \
    openssl \
    ; \
    \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
    \
    chmod +x /usr/local/bin/gosu; \
    # verify that the binary works
    gosu nobody true; \
    \
    apk del .gosu-deps

RUN apk update && \
    apk add --no-cache \
    bash \
    build-base \
    ca-certificates \
    curl \
    coreutils \
    git \
    libffi-dev \
    linux-headers \
    openssl \
    openssl-dev \
    python \
    python-dev \
    py-pip && \
    pip install --upgrade pip && \
    pip install razorpay.alohomora==$ALOHOMORA_VER && \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 && \
    chmod +x /usr/local/bin/dumb-init && \
    rm -rf ~/.cache/pip/*

COPY config.yaml.j2 /atlantis/config.yaml.j2

COPY ./entrypoint.sh .

CMD ["/bin/sh", "./entrypoint.sh"]
