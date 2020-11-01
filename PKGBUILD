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
            'd5328ebd6755211f6791b856daace901cda1c4cccfa5bfba4db81071b20dc080')

package() {
    install -Dm755 slimify.script "$pkgdir/usr/share/libalpm/scripts/slimify"
    install -Dm644 slimify.hook "$pkgdir/usr/share/libalpm/hooks/99-slimify.hook"
}
