class Xtrans < Formula
  desc "Xorg Libraries: xtrans"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/xtrans-1.3.5.tar.bz2"
  sha256 "adbd3b36932ce4c062cd10f57d78a156ba98d618bdb6f50664da327502bc8301"
  # tag "linuxbrew"

  option "with-docs", "Build documentation"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build

  if build.with?("docs")
    option "with-libxslt", "Build docs using xsltproc"
    option "with-xmlto",   "Build docs using xmlto"
    option "with-fop",     "Build docs using fop"
    depends_on "libxslt" => :build if build.with?("libxslt")
    depends_on "xmlto"   => :build if build.with?("xmlto")
    depends_on "fop"     => :build if build.with?("fop")
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
    args << "--enable-docs" if build.with?("docs")
    args << "--with-xslt"   if build.with?("libxslt")
    args << "--with-xmlto"  if build.with?("xmlto")
    args << "--with-fop"    if build.with?("fop")

    system "./configure", *args
    system "make", "install"
  end
end
