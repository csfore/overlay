# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="Guix package manager"
HOMEPAGE="https://guix.gnu.org/"
SRC_URI="mirror://gnu/guix/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

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
