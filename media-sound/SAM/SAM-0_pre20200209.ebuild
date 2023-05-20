EAPI=8

DESCRIPTION="Software Automatic Mouth - Tiny Speech Synthesizer"
HOMEPAGE="https://simulationcorner.net/index.php?page=sam"
SRC_URI="https://github.com/s-macke/SAM/archive/a7b36ef.tar.gz -> ${PN}.tar.gz"

COMMIT="a7b36efac730957b59471a42a45fd779f94d77dd"

LICENSE="Unlicensed"
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
)

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	mv "${PN}-${COMMIT}" "${P}"
}

src_prepare() {
	eapply "${FILESDIR}/variables-redef.patch"
	eapply_user
}

src_install() {
	if [[ -f Makefile ]]; then
		emake DESTDIR="${D}"
	fi
	einstalldocs
	dobin sam
}
