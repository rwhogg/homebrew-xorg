class Xset < Formula
  desc "X.Org Applications: xset"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7app.html
  url    "https://www.x.org/pub/individual/app/xset-1.2.3.tar.bz2"
  mirror "http://ftp.x.org/pub/individual/app/xset-1.2.3.tar.bz2"
  sha256 "4382f4fb29b88647e13f3b4bc29263134270747fc159cfc5f7e3af23588c8063"
  # tag "linuxbrew"

  depends_on "pkg-config" =>  :build
  depends_on "xproto" => :build
  depends_on "libxmu"
  depends_on "libx11"
  depends_on "libxext"
  depends_on "libxfontcache"
  depends_on "libxxf86misc"

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]
    #   --without-xf86misc      Disable xf86misc support.
    #   --without-fontcache     Disable fontcache support

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
