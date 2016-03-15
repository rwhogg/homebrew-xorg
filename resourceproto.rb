class Resourceproto < Formula
  desc "Xorg Protocol Headers: resourceproto"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/proto/resourceproto-1.2.0.tar.bz2"
  sha256 "3c66003a6bdeb0f70932a9ed3cf57cc554234154378d301e0c5cfa189d8f6818"
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
      --disable-dependency-tracking
      --disable-silent-rules
    ]

    system "./configure", *args
    system "make", "install"
  end
end
