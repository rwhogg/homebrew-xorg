class LibvaIntelDriver < Formula
  desc "libva Intel driver"
  homepage "http://www.freedesktop.org/"
  url "http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver/libva-intel-driver-1.7.0.tar.bz2"
  sha256 "9d19d6c789a9a4fbce23c4f0eaf993ba776b512bec4c87982ab17ac841435c0c"

  # Build-time
  depends_on "pkg-config" => :build

  # Required
  depends_on "libva"

  # optional
  depends_on "wayland" => :recommended # if libva was built with wayland support

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-dependency-tracking
      --disable-silent-rules
      ]

    system "./configure", *args
    system "make"
    system "make", "install"

    ohai "libva Intel driver has been installed"
    prefix.install "README" => "libva-intel-driver.md"
  end
end
