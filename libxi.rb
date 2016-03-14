class Libxi < Formula
  desc "Xorg Libraries: libXi"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXi-1.7.6.tar.bz2"
  sha256 "1f32a552cec0f056c0260bdb32e853cec0673d2f40646ce932ad5a9f0205b7ac"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build

  depends_on "libxfixes"  =>  :build
  depends_on "xextproto"  =>  :build
  depends_on "libxext"
  depends_on "libx11"
  depends_on "xproto"     =>  :build
  depends_on "inputproto" =>  :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"
  end
end
