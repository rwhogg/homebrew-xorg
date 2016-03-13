class Libdmx < Formula
  desc "Xorg Libraries: libdmx"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libdmx-1.1.3.tar.bz2"
  sha256 "c97da36d2e56a2d7b6e4f896241785acc95e97eb9557465fd66ba2a155a7b201"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "libx11"
  depends_on "libxext"
  depends_on "xextproto"  =>  :build
  depends_on "dmxproto"   =>  :build
  depends_on "libxcb"     =>  :run
  depends_on "libxau"     =>  :run
  depends_on "libxdmcp"   =>  :run

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"
  end
end
