# 0. Build package stage
FROM archlinux as builder

RUN set -ex; \
    pacman --noprogressbar --noconfirm -Syyu base-devel git

USER nobody
WORKDIR /tmp

COPY --chown=nobody:nobody . /tmp

RUN set -ex; \
    makepkg -s

# 1. Runtime image
FROM archlinux

COPY --from=builder /tmp/*.pkg.tar.zst /opt/

RUN set -ex; \
    # Install custom-built package from previous stage
    pacman --noprogressbar --noconfirm -U /opt/*.pkg.tar.zst; \
    # Install a package to see it work!
    pacman --noprogressbar --noconfirm -Syy ruby-docs; \
    find /var/cache/pacman/pkg/
