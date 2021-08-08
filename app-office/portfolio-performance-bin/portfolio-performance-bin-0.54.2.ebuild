# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="Tool to calculate the overall performance of an investment portfolio"
HOMEPAGE="https://www.portfolio-performance.info/en/"
SRC_URI="https://github.com/buchen/portfolio/releases/download/${PV}/PortfolioPerformance-${PV}-linux.gtk.x86_64.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/portfolio"

src_install() {
	# Install to /opt, as this is a binary package
	local dest="/opt/${P}"
	dodir "${dest}"
	cp -pPR "${S}"/* "${D}${dest}" || die "copying files to target directory failed"

	# Create a symlink to the binary from /usr/bin
	dosym "${dest}/PortfolioPerformance" /usr/bin/portfolioPerformance

	# Setup .desktop file
	domenu "${FILESDIR}/portfolio-performance.desktop"
}
