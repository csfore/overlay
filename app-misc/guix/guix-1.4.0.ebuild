# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit systemd

DESCRIPTION="Guix package manager"
HOMEPAGE="https://guix.gnu.org/"
SRC_URI="mirror://gnu/guix/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

RDEPEND="
	acct-user/guix
	acct-group/guix
"

BDEPEND="virtual/pkgconfig
	>=dev-scheme/guile-3.0.0
	dev-scheme/guile-gnutls
	dev-scheme/guile-git
	dev-scheme/guile-json
	dev-scheme/guile-sqlite3
	dev-scheme/guile-gcrypt
	dev-scheme/guile-zlib
	dev-scheme/guile-lzlib"

QA_PREBUILT="*.go"

src_install() {
	default

	# Guix fails to compile if it stores its ccache
	#find "${D}" -name '*.go' -delete || die

	systemd_dounit "${FILESDIR}"/guix-publish.service
	systemd_dounit "${FILESDIR}"/guix-gc.service
	systemd_dounit "${FILESDIR}"/guix-daemon.service

	systemd_dounit "${FILESDIR}"/gnu-store.mount
	systemd_dounit "${FILESDIR}"/guix-gc.timer

	doinitd "${FILESDIR}"/guix-daemon

	#elog "WARNING: There is currently a bug in the ccache Guile generates"
	#elog "for Guix, resulting in compile failures unpon a rebuild."
	#elog "To remedy this, run:"
	#elog "# rm /usr/lib64/guile/3.0/site-ccache/guix/build-system/clojure.go\n\n"
	elog "To allow for parallel installs, create more guix users in the guix group"
}
