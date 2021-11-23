EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="Python bindings for Apache Arrow"
HOMEPAGE="https://arrow.apache.org/"
SRC_URI="https://github.com/apache/arrow/archive/refs/tags/apache-arrow-${PV}.tar.gz"

SLOT=0
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

IUSE="+parquet"

RDEPEND="
	dev-libs/arrow[python,${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
			dev-python/numpy[${PYTHON_USEDEP}]
	')
"

S="${WORKDIR}/arrow-apache-arrow-${PV}/python"

python_configure_all() {
	export PYARROW_WITH_PARQUET=$(usex parquet)
}
