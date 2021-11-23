EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="Tools for doing Collider HEP style analysis with columnar operations."
HOMEPAGE="https://github.com/CoffeaTeam/${PN}"
SRC_URI="https://github.com/CoffeaTeam/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/awkward-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/uproot-4.1.6[${PYTHON_USEDEP}]
	"
