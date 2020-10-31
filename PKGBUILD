# Maintainer: Tom Richards <tom@tomrichards.net>
pkgname=slimify
pkgver=1.0.0
pkgrel=1
pkgdesc="A package to automatically trim unnecessary files from docker images."
arch=('any')
url="https://github.com/t-richards/slimify"
license=('MIT')
source=(
    "slimify.script"
    "slimify.hook"
)
sha256sums=('b999539efec2cdd3773aad529afe6cd137b6affaefb452556c183080620b01ae'
            '7bd1e7f0eff0f9c393e601888042e9c3c180f2336468a16c087a155132214df9')

package() {
    install -Dm755 slimify.script "$pkgdir/usr/share/libalpm/scripts/slimify"
    install -Dm644 slimify.hook "$pkgdir/usr/share/libalpm/hooks/slimify.hook"
}
