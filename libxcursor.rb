class Libxcursor < Formula
  desc "Xorg Libraries: libXcursor"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXcursor-1.1.14.tar.bz2"
  sha256 "9bc6acb21ca14da51bda5bc912c8955bc6e5e433f0ab00c5e8bef842596c33df"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "libxrender"
  depends_on "libxfixes"
  depends_on "libx11"
  depends_on "fixesproto" =>  :build
  depends_on "libxau"     =>  :run
  depends_on "libxcb"     =>  :run
  depends_on "libxdmcp"   =>  :run

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
