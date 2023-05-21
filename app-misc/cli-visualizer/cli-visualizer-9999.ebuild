EAPI=8

inherit cmake
inherit git-r3

DESCRIPTION="CLI based audio visualizer"
HOMEPAGE="https://github.com/dpayne/cli-visualizer"
EGIT_REPO_URI="https://github.com/dpayne/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		sci-libs/fftw
		dev-util/cmake
		sys-libs/ncurses
		"
RDEPEND=${DEPEND}
BDEPEND=""
