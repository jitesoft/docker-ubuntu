# Ubuntu

[![Docker Pulls](https://img.shields.io/docker/pulls/jitesoft/ubuntu.svg)](https://hub.docker.com/r/jitesoft/ubuntu)
[![Back project](https://img.shields.io/badge/Open%20Collective-Tip%20the%20devs!-blue.svg)](https://opencollective.com/jitesoft-open-source)

Dockerfile with Ubuntu core built from https://partner-images.canonical.com/core/

## Tags

Tags are named after version name and version number, latest lts is tagged with `lts` and latest version is tagged with `latest`.

All images is built for the following architectures: `amd64/x86_64`, `arm64`, `armv7`, `ppc64le`.  
Images after Xenial also include images for `s390x`.  
Images before focal also includes images for `i386`.  

### Registries

The `jitesoft/ubuntu` image can be found at the following registries:

* `jitesoft/ubuntu`
* `ghcr.io/jitesoft/ubuntu`
* `registry.gitlab.com/jitesoft/dockerfiles/ubuntu`

## Dockerfile

Dockerfile can be found at [GitLab](https://gitlab.com/jitesoft/dockerfiles/ubuntu) and [GitHub](https://github.com/jitesoft/docker-ubuntu)

## Licenses

The files in this repo is released under the MIT license, with exception to the snippet of code
in the dockerfile which is clearly noted not to be.  
The software in the image is released under various licenses, and you should (as always) assert the licenses
before using the specific software.

Ubuntu licenses and information can be found at: https://ubuntu.com/licensing

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

### Signature

Cosign public key for this image can be found at [https://jitesoft.com/cosign.pub](https://jitesoft.com/cosign.pub).

### Licenses

Files in this repository is released under the MIT license.  
Read the Ubuntu license [here](https://ubuntu.com/licensing).

### Sponsors

Sponsoring is vital for the further development and maintaining of open source projects.  
Questions and sponsoring queries can be made via <a href="mailto:sponsor@jitesoft.com">email</a>.  
If you wish to sponsor our projects, reach out to the email above or visit any of the following sites:

[Open Collective](https://opencollective.com/jitesoft-open-source)  
[GitHub Sponsors](https://github.com/sponsors/jitesoft)  
[Patreon](https://www.patreon.com/jitesoft)

Jitesoft images are built via GitLab CI on runners hosted by the following wonderful organisations:

<a href="https://fosshost.org/">
  <img src="https://raw.githubusercontent.com/jitesoft/misc/master/sponsors/fosshost.png" width="256" alt="Fosshost logo" />
</a>

_The companies above are not affiliated with Jitesoft or any Jitesoft Projects directly._
