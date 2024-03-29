FROM scratch
ARG VERSION
ARG NAME
ARG TARGETPLATFORM
ARG TARGETARCH
ARG BUILD_TIME

LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/ubuntu" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/ubuntu/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/ubuntu" \
      com.jitesoft.app.ubuntu.version="${VERSION}" \
      com.jitesoft.app.ubuntu.version.name="${NAME}" \
      com.jitesoft.build.arch="${TARGETARCH}" \
      # Open container labels
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.created="${BUILD_TIME}" \
      org.opencontainers.image.description="Ubuntu linux" \
      org.opencontainers.image.vendor="Jitesoft" \
      org.opencontainers.image.source="https://gitlab.com/jitesoft/dockerfiles/ubuntu" \
      # Artifact hub annotations
      io.artifacthub.package.alternative-locations="oci://index.docker.io/jitesoft/ubuntu,oci://ghcr.io/jitesoft/ubuntu,oci://quay.io/jitesoft/ubuntu" \
      io.artifacthub.package.readme-url="https://gitlab.com/jitesoft/dockerfiles/ubuntu/-/raw/master/README.md" \
      io.artifacthub.package.logo-url="https://jitesoft.com/favicon-96x96.png"

ADD artifacts/${TARGETPLATFORM}/ubuntu-root.tar.gz /

# The following tweeks are currently copied from the official Ubuntu image at https://github.com/tianon/docker-brew-ubuntu-core/ (released under the Apache 2.0 license)
RUN set -xe \
 && echo '#!/bin/sh' > /usr/sbin/policy-rc.d \
 && echo 'exit 101' >> /usr/sbin/policy-rc.d \
 && chmod +x /usr/sbin/policy-rc.d \
 && dpkg-divert --local --rename --add /sbin/initctl \
 && cp -a /usr/sbin/policy-rc.d /sbin/initctl \
 && sed -i 's/^exit.*/exit 0/' /sbin/initctl \
 && echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup \
 && echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean \
 && echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean \
 && echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean \
 && echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages \
 && echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes \
 && echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests \
 && mkdir -p /run/systemd && echo 'docker' > /run/systemd/container

CMD ["/bin/bash"]
