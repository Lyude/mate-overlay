# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
GCONF_DEBUG="no"

inherit mate

DESCRIPTION="Applet showing network traffic for MATE"
HOMEPAGE="http://mate-desktop.org/"

SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86 ~arm"

#FIXME: wireless-tools >= 28pre9 is automagic
RDEPEND=">=mate-base/mate-panel-1.6.0
	>=gnome-base/libgtop-2.14.2"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	>=app-text/gnome-doc-utils-0.3.2
	>=dev-util/intltool-0.35.0"

DOCS="AUTHORS ChangeLog README"

src_prepare() {
	mv configure.in configure.ac
	epatch ${FILESDIR}/${P}_fix_autoconf_warn.patch
	mate_src_prepare
}
