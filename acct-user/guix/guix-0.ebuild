# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for the Guix package manager"
# Two are needed for some reason
ACCT_USER_GROUPS=(
	guix
	guix
)
ACCT_USER_ID=600

acct-user_add_deps
