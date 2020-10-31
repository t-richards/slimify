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
sha256sums=('b5e281e54e35ac83f4c2e639dbba124f2627cc287bc082ba1951cded51a3af3d'
            '7bd1e7f0eff0f9c393e601888042e9c3c180f2336468a16c087a155132214df9')

package() {
    install -Dm644 slimify.hook "$pkgdir/usr/share/libalpm/hooks"
    install -Dm755 slimify.script "$pkgdir/usr/share/libalpm/scripts/slimify"
}
