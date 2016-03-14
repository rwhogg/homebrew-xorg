class Libxaw < Formula
  desc "Xorg Libraries: libXaw"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXaw-1.0.13.tar.bz2"
  sha256 "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "xproto"     =>  :build
  depends_on "libx11"
  depends_on "libxext"
  depends_on "xextproto"  =>  :build
  depends_on "libxt"
  depends_on "libxmu"
  depends_on "libxpm"

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
