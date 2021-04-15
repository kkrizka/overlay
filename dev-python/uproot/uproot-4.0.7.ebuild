EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="ROOT I/O in pure Python and NumPy."
HOMEPAGE="https://github.com/scikit-hep/${PN}4"
SRC_URI="https://github.com/scikit-hep/${PN}4/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${PN}4-${PV}
