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
sha256sums=() # generate with 'makepkg -g'

package() {
	install -Dm644 slimify.hook "$pkgdir/usr/share/libalpm/hooks"
    install -Dm755 gtk-update-icon-cache.script "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}
