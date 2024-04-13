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

	systemd_dounit "${FILESDIR}"/guix-publish.service
	systemd_dounit "${FILESDIR}"/guix-gc.service
	systemd_dounit "${FILESDIR}"/guix-daemon.service

	systemd_dounit "${FILESDIR}"/gnu-store.mount
	systemd_dounit "${FILESDIR}"/guix-gc.timer

	doinitd "${FILESDIR}"/guix-daemon
}

pkg_postinst() {
	ewarn "Currently rebuilding with Guix's current ccache breaks compilation, to"
	ewarn "remedy this, run:"
	ewarn "rm /usr/lib64/guile/3.0/site-ccache/guix/build/java-utils.go"
	einfo "To allow for parallel installs, create more users in the guix group"
}
