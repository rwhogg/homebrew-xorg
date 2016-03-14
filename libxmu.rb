class Libxmu < Formula
  desc "Xorg Libraries: libXmu"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXmu-1.1.2.tar.bz2"
  sha256 "756edc7c383254eef8b4e1b733c3bf1dc061b523c9f9833ac7058378b8349d0b"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build

  depends_on "libxt"
  depends_on "libxext"
  depends_on "libx11"
  depends_on "libxau"    =>  :run
  depends_on "libxcb"    =>  :run
  depends_on "xextproto" =>  :build
  depends_on "libice"    =>  :run
  depends_on "libsm"     =>  :run

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
