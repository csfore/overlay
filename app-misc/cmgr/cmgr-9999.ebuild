# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/csfore/cmgr.git"
else
	SRC_URI="https://github.com/csfore/cmgr/releases/download/${PV}/cmgr-${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Chroot manager program tailored towards Gentoo developers"
HOMEPAGE="https://github.com/csfore/cmgr"

LICENSE="GPL-3"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPENDS="
	${PYTHON_DEPS}
"
DEPEND="
	${PYTHON_DEPS}
"
RDEPEND="
	${PYTHON_DEPS}
	dev-python/click
"
