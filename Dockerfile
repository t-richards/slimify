# 0. Build package stage
FROM archlinux as builder

RUN set -ex; \
    pacman --noprogressbar --noconfirm -Syyu base-devel git

USER nobody
WORKDIR /tmp

COPY --chown=nobody:nobody . /tmp

# Create slimify.pkg.tar.zst
RUN set -ex; \
    makepkg -s

# 1. Runtime image
FROM archlinux

# Copy slimify.pkg.tar.zst from previous stage
COPY --from=builder /tmp/slimify.pkg.tar.zst /opt/

RUN set -ex; \
    # Install slimify package
    pacman --noprogressbar --noconfirm -U /opt/slimify.pkg.tar.zst; \
    # The rest of your image build steps go below here
    # Install a package to see it in action!
    pacman --noprogressbar --noconfirm -Syy ruby; \
    find /var/cache/pacman/pkg/
