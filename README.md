# slimify

A script for removing unnecessary junk from your docker images.

This repository also contains an Arch Linux package to automatically perform the cleanup whenever a package is installed, updated, or removed via `pacman`.

You probably shouldn't install this package on your local machine.

## Getting started

### Arch Linux image

```dockerfile
# 0. Build package stage
FROM archlinux as builder

RUN set -ex; \
    pacman --noprogressbar --noconfirm -Syyu base-devel git

USER nobody
WORKDIR /tmp

RUN set -ex; \
    git clone https://github.com/t-richards/slimify; \
    cd slimify; \
    makepkg -s

# 1. Runtime image
FROM archlinux

COPY --from=builder /tmp/slimify/*.pkg.tar.zst /opt/

RUN set -ex; \
    # Install custom-built package from previous stage
    pacman --noprogressbar --noconfirm -U /opt/*.pkg.tar.zst; \
    # Your image build steps here
    pacman --noprogressbar --noconfirm -Syy ruby-docs
```

:tada: That's it! Any time you install, upgrade, or remove a package via pacman, `slimify` will automatically purge the filesystem of unneeded files.

### Other OS image

```dockerfile
# 0. Runtime image
FROM alpine

COPY --chmod=755 slimify.script /usr/bin/slimify

RUN set -ex; \
    # Your image build steps here
    apk add --no-cache --update ruby; \
    # Run slimify to manually clean things up
    slimify
```

## License

[MIT](LICENSE)
