FROM runatlantis/atlantis
WORKDIR /usr/local/bin

RUN curl -O https://github.com/sspinc/terraform-provider-credstash/releases/download/v0.2.1/terraform-provider-credstash_linux_amd64 \
    && chmod +x /usr/local/bin/terraform-provider-credstash_linux_amd64 \
    && curl -O https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip \
    && unzip -o terraform_0.10.8_linux_amd64.zip \
    && chmod +x /usr/local/bin/terraform

ENV ALOHOMORA_VER="0.4.4"
ENV GOSU_VERSION="1.10"
RUN apk add --no-cache \
    bash \
    build-base \
    ca-certificates \
    coreutils \
    curl \
    dumb-init \
    git \
    libffi-dev \
    linux-headers \
    openssl \
    openssl-dev \
    python \
    python-dev \
    py-pip \
    && pip install --upgrade pip \
    && pip install razorpay.alohomora==$ALOHOMORA_VER \
    && rm -rf ~/.cache/pip/*

COPY config.yaml.j2 entrypoint.sh /atlantis/

ENTRYPOINT ["/atlantis/entrypoint.sh"]
