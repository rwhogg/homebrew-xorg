class Libsm < Formula
  desc "Xorg Libraries: libSM"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libSM-1.2.2.tar.bz2"
  sha256 "0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "xproto"     =>  :build
  depends_on "xorg-sgml-doctools" => [:build, :recommended]
  depends_on "libice"     =>  :build
  depends_on "xtrans"     =>  :build

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
