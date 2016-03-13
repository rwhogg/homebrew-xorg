class Videoproto < Formula
  desc "Xorg Protocol Headers: videoproto"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/proto/videoproto-2.3.2.tar.bz2"
  sha256 "8dae168cb820fcd32f564879afb3f24d27c176300d9af66819a18265539bd4b6"
  # tag "linuxbrew"

  # depends_on :autoconf
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
