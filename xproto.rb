class Xproto < Formula
  desc "Xorg Protocol Headers: xproto"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/proto/xproto-7.0.28.tar.bz2"
  sha256 "29e85568d1f68ceef8a2c081dad9bc0e5500a53cfffde24b564dc43d46ddf6ca"
  # tag "linuxbrew"

  depends_on "pkg-config"         =>  :build
  depends_on "util-macros"        =>  :build
  depends_on "xorg-sgml-doctools" => [:build, :recommended]
  depends_on "fop"                => [:build, :optional]
  depends_on "libxslt"            => [:build, :optional]
  depends_on "xmlto"              => [:build, :optional]
  depends_on "asciidoc"           => [:build, :optional]

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]

    system "./configure", *args
    system "make", "install"
  end
end
