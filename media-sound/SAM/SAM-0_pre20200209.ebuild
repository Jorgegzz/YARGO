# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="a7b36efac730957b59471a42a45fd779f94d77dd"

DESCRIPTION="Software Automatic Mouth - Tiny Speech Synthesizer"
HOMEPAGE="https://simulationcorner.net/index.php?page=sam"

MY_PV="${PV/.0/}"
MY_P="${PN}-${MY_PV}"

SRC_URI="https://github.com/s-macke/SAM/archive/${MY_P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="sdl"

DEPEND="
	sdl? ( media-libs/sdl-sound )
	"
RDEPEND=${DEPEND}
BDEPEND=""

PATCHES=(
	"${FILESDIR}/variables-redef.patch"
	"${FILESDIR}/no-sdl-compiler-flags.patch"
)

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	mv "${PN}-${COMMIT}" "${P}"
}

src_prepare() {
	eapply "${FILESDIR}/variables-redef.patch"
	! use sdl && eapply "${FILESDIR}/no-sdl-compiler-flags.patch"

	eapply_user
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	einstalldocs
	dobin sam
}
