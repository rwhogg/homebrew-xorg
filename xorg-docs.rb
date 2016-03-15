class XorgDocs < Formula
  desc "Xorg ocumentation that doesn't better fit into other packages"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://www.x.org/archive/individual/doc/xorg-docs-1.7.tar.bz2"
  sha256 "b9b1918bd365e9eb29c325e76bb8c4d774d37be707e433fb0af94da35683375f"
  # tag "linuxbrew"

  option "without-docs",  "Disable building the documentation"
  option "without-specs", "Disable building the specs"
  option "with-check",    "Issue make check before installation"

  depends_on "util-macros" => [:build, :recommended]
  depends_on "xorg-sgml-doctools" => [:build, :recommended]

  def install
    args = %W[]
    args << "--prefix=#{prefix}"
    args << "--enable-docs"      if !build.without?("docs")
    args << "--enable-specs"     if !build.without?("specs")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"
  end
end
