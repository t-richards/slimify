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
sha256sums=('57ac870f32da77cd0c05f5cac2ff43ff97763c6431e823b7765c8fda51626d97'
            'd5328ebd6755211f6791b856daace901cda1c4cccfa5bfba4db81071b20dc080')

package() {
    install -Dm755 slimify.script "$pkgdir/usr/share/libalpm/scripts/slimify"
    install -Dm644 slimify.hook "$pkgdir/usr/share/libalpm/hooks/99-slimify.hook"
}
