class Libxdmcp < Formula
  desc "X Display Manager Control Protocol"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXdmcp-1.1.2.tar.bz2"
  sha256 "81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2"
  # tag "linuxbrew"
  
  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on "xorg-sgml-doctools" => [:build, :recommended]
  depends_on "fop"                => [:build, :optional]
  depends_on "libxslt"            => [:build, :optional]
  depends_on "xmlto"              => [:build, :optional]
  depends_on "asciidoc"           => [:build, :optional]

  args  = %W[]
  args << "without-xorg-sgml-doctools" if build.without?("xorg-sgml-doctools")
  args << "with-fop"                   if build.with?("fop")
  args << "with-libxslt"               if build.with?("libxslt")
  args << "with-xmlto"                 if build.with?("xmlto")
  args << "with-asciidoc"              if build.with?("asciidoc")

  # depends_on :autoconf
  depends_on "pkg-config"         => :build
  depends_on "xorg-protocols"     => args

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
	  args << "--disable-static" if build.without?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"

  end
end
