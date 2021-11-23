EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="Manipulate JSON-like data with NumPy-like idioms."
HOMEPAGE="https://github.com/scikit-hep/${PN}-1.0"
SRC_URI="https://github.com/scikit-hep/${PN}-1.0/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/pybind11[${PYTHON_USEDEP}]
	"

PATCHES=(
	"${FILESDIR}/${PN}-system-pybind11.patch"
)

S=${WORKDIR}/${PN}-1.0-${PV}
