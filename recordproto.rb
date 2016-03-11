class Recordproto < Formula
  desc "Xorg Protocol Headers: recordproto"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/proto/recordproto-1.14.2.tar.bz2"
  sha256 "a777548d2e92aa259f1528de3c4a36d15e07a4650d0976573a8e2ff5437e7370"
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
