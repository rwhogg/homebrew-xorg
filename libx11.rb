class Libx11 < Formula
  desc "Xorg Libraries: libX11"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libX11-1.6.3.tar.bz2"
  sha256 "cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  #depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "xextproto"  =>  :build
  depends_on "xtrans"     =>  :build
  depends_on "libxcb"
  depends_on "kbproto"    =>  :build
  depends_on "inputproto" =>  :build
  depends_on "libxau"     =>  :run
  depends_on "libxdmcp"   =>  :run

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"
  end
end
