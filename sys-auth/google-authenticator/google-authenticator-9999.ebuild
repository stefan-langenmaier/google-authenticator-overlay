# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit pam git-r3 autotools

DESCRIPTION="PAM Module for two step verification via mobile platform"
HOMEPAGE="http://code.google.com/p/google-authenticator/"
EGIT_REPO_URI="git://github.com/google/google-authenticator.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="qrcode"

DEPEND="virtual/pam"

RDEPEND="${DEPEND}
	qrcode? ( media-gfx/qrencode )"

S=${WORKDIR}/${P}/libpam

src_prepare(){
        eautoreconf
}

src_install(){
        dopammod .libs/pam_google_authenticator.so
        dobin google-authenticator
        dodoc README.md
        dohtml totp.html
}

pkg_postinst(){
        elog "For further information see"
        elog "http://wiki.gentoo.org/wiki/Google_Authenticator"
}
