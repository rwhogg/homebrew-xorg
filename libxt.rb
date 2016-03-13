class Libxt < Formula
  desc "Xorg Libraries: libXt"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXt-1.1.5.tar.bz2"
  sha256 "46eeb6be780211fdd98c5109286618f6707712235fdd19df4ce1e6954f349f1a"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build
  
  depends_on "libsm"      =>  :build
  depends_on "libice"
  depends_on "libsm"      =>  :run
  depends_on "libx11"
  depends_on "libxau"     =>  :run
  depends_on "libxcb"     =>  :run
  depends_on "libxdmcp"   =>  :run
  depends_on "xproto"     =>  :build
  depends_on "kbproto"    =>  :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --with-appdefaultdir=#{etc}/X11/app-defaults
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"

  end
end
