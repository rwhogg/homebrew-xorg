class Libxcb < Formula
  desc "An interface to the X Window System protocol, which replaces the current Xlib interface"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://xcb.freedesktop.org/dist/libxcb-1.11.1.tar.bz2"
  sha256 "b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedbf69d30"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-tests",  "Run tests upon installation"
  option "with-static", "Build static libraries"
  option "without-doxygen", "Do not generate API documentation"

  depends_on "pkg-config"  => :build
  depends_on "libxau"
  depends_on "xcb-proto"   => :build
  depends_on "libxdmcp"    => :recommended

  depends_on "doxygen" => :build if !build.without?("doxygen")
  depends_on "check"   => :build if build.with?("tests")
  depends_on "libxslt" => [:build, :optional]

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --enable-xinput
      --disable-dependency-tracking
      --disable-silent-rules
    ]
    args << "--without-doxygen" if build.without?("doxygen")
	  args << "--disable-static" if !build.with?("static")

    ## Get rid of dependency on libpthread-stubs
    inreplace "configure", /pthread-stubs/, ""

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"
  end
end
