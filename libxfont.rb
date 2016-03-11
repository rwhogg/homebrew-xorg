class Libxfont < Formula
  desc "Xorg Libraries: libXfont"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXfont-1.5.1.tar.bz2"
  sha256 "b70898527c73f9758f551bbab612af611b8a0962202829568d94f3edf4d86098"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"
  option "with-devel-docs", "Build text documentation"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build

  depends_on "xproto"     =>  :build
  depends_on "xtrans"     =>  :build
  depends_on "fontsproto" =>  :build
  depends_on "libfontenc" =>  :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
	  args << "--disable-static" if !build.with?("static")
    args << "--disable-devel-docs" if !build.with?("devel-docs")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"

  end
end
