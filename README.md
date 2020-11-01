# slimify

An Arch Linux package for automatically removing unnecessary junk from Arch Linux-based docker images.

You probably shouldn't install this package on your local machine. 

## Getting started

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
    # Add your own files and install anything else you need
    pacman --noprogressbar --noconfirm -S cmatrix

CMD ["/usr/bin/cmatrix"]
```

:tada: That's it! Any time you install, upgrade, or remove a package via pacman, `slimify` will automatically purge the filesystem of unneeded files.

## License

[MIT](LICENSE)
