# Ruby-Jekyll image

> Prebuilt Ruby-Jekyll images to improve the speed, security and reliability of dependencies when developing and publishing Jekyll websites.

![workflows](https://img.shields.io/badge/-Workflows:-white?style=flat-square) [![Integration](https://github.com/seantrane/image-ruby-jekyll/actions/workflows/integration.yml/badge.svg)](https://github.com/seantrane/image-ruby-jekyll/actions/workflows/integration.yml) [![Delivery](https://github.com/seantrane/image-ruby-jekyll/actions/workflows/delivery.yml/badge.svg)](https://github.com/seantrane/image-ruby-jekyll/actions/workflows/delivery.yml) [![Deployment](https://github.com/seantrane/image-ruby-jekyll/actions/workflows/deployment.yml/badge.svg)](https://github.com/seantrane/image-ruby-jekyll/actions/workflows/deployment.yml)

## Table of Contents

- [About](#about)
- [Usage](#usage)
- [Support](#support)
- [Contributing](#contributing)
- [Changelog](#changelog)
- [License](#license)

---

## About <a id="about"></a>

`image-ruby-jekyll` is used to manage prebuilt Ruby images with the [Jekyll static website generator](https://jekyllrb.com) preinstalled, along with any dependencies they require to work with each other. The Ruby version will always be pinned to highest version compatible (e.g. `3.4.9`) with the highest version of Jekyll that exists (e.g. `4.4.1`).

The only development task to perform with this repo is submit a pull-request with version changes to Ruby and/or Jekyll. If the Integration workflow succeeds, then a merge to main will trigger a new release and publish a new image. The published image is tagged with the Ruby-Jekyll versions inside it.

## Usage <a id="usage"></a>

In a `Dockerfile`:

```dockerfile
FROM ghcr.io/seantrane/image-ruby-jekyll:ruby-3.4.9_jekyll-4.4.1
```

In a `docker-compose.yml` file:

```yaml
services:
  jekyll:
    image: ghcr.io/seantrane/image-ruby-jekyll:ruby-3.4.9_jekyll-4.4.1
    container_name: jekyll-v4.4.1
    pull_policy: if_not_present
    build:
      context: .
    env_file:
      - ./.env
    command: sh -c "bundle install && bundle exec jekyll serve --watch --force_polling -H 0.0.0.0 -P 4000 || exit 1"
```

`pull_policy: if_not_present` is used because the image tag is explicit and will never change. However, the `ghcr.io/seantrane/image-ruby-jekyll:latest` image will always refer to the latest version published, though not recommended for production usage.

---

## Support <a id="support"></a>

[Submit an issue](https://github.com/seantrane/image-ruby-jekyll/issues/new), in which you should provide as much detail as necessary for your issue.

## Contributing <a id="contributing"></a>

Contributions are always appreciated. Read [CONTRIBUTING.md](https://github.com/seantrane/image-ruby-jekyll/blob/main/CONTRIBUTING.md) documentation to learn more.

## Changelog <a id="changelog"></a>

Release details are documented in the [CHANGELOG.md](https://github.com/seantrane/image-ruby-jekyll/blob/main/CHANGELOG.md) file, and on the [GitHub Releases page](https://github.com/seantrane/image-ruby-jekyll/releases).

---

## License <a id="license"></a>

[ISC License](https://github.com/seantrane/image-ruby-jekyll/blob/main/LICENSE)

Copyright (c) 2026 [Sean Trane Sciarrone](https://github.com/seantrane)
