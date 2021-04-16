EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit cmake python-single-r1

DESCRIPTION="Columnar in-memory analytics layer for big data"
HOMEPAGE="https://arrow.apache.org/"
SRC_URI="https://github.com/apache/arrow/archive/refs/tags/apache-arrow-${PV}.tar.gz
	https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2
	https://apache.osuosl.org/thrift/0.12.0/thrift-0.12.0.tar.gz
	"

SLOT=0
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

IUSE="python +parquet +snappy"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

CDEPEND="
	python? ( ${PYTHON_DEPS} )
"

PATCHES=(
	"${FILESDIR}"/${P}-cmake-docdir.patch
)

S="${WORKDIR}/arrow-apache-arrow-${PV}"
CMAKE_USE_DIR="${S}/cpp"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DARROW_PYTHON=$(usex python) \
		-DARROW_PARQUET=$(usex parquet) \
		-DARROW_WITH_SNAPPY=$(usex snappy) \
		${EXTRA_ECONF}
	)

	CMAKE_BUILD_TYPE=Release \
	ARROW_THRIFT_URL=${DISTDIR}/thrift-0.12.0.tar.gz \
	ARROW_JEMALLOC_URL=${DISTDIR}/jemalloc-5.2.1.tar.bz2 \
	cmake_src_configure
}
