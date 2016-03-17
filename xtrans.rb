class Xtrans < Formula
  desc "Xorg Libraries: xtrans"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/xtrans-1.3.5.tar.bz2"
  sha256 "adbd3b36932ce4c062cd10f57d78a156ba98d618bdb6f50664da327502bc8301"
  # tag "linuxbrew"

  option "with-docs", "Build documentation"

  depends_on "pkg-config" =>  :build

  depends_on :autoconf  # needed for autoreconf
  # Patch for xmlto
  patch do
    url "https://raw.githubusercontent.com/Linuxbrew/homebrew-xorg/master/patch_aclocal_m4.diff"
    sha256 "684b6ae834727535ee6296db17e8c33ae5d01e118326b341190a4d0deec108e5"
  end

  if build.with?("docs")
    depends_on "xmlto"   => [:build, :recommended]
    depends_on "fop"     => [:build, :recommended]
    depends_on "libxslt" => [:build, :recommended]
    depends_on "xorg-sgml-doctools" => [:build, :recommended]
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]

    # Be explicit about the configure flags
    args << "--enable-static=#{build.with?("static") ? "yes" : "no"}"
    args << "--enable-docs=#{build.with?("docs") ? "yes" : "no"}"

    system "autoreconf", "-fiv"
    system "./configure", *args
    system "make", "install"
  end
end
