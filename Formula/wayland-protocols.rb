class WaylandProtocols < Formula
  desc "Additional Wayland protocols"
  homepage "https://wayland.freedesktop.org"
  url "https://wayland.freedesktop.org/releases/wayland-protocols-1.17.tar.xz"
  sha256 "df1319cf9705643aea9fd16f9056f4e5b2471bd10c0cc3713d4a4cdc23d6812f"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-xorg"
    cellar :any_skip_relocation
    sha256 "b1fa24de720775a6a795c448226a87278e062f7b23f849e8f8ea7cd46f75c47b" => :x86_64_linux
  end

  head do
    url "git://anongit.freedesktop.org/wayland/wayland-protocols"
  end

  option "without-test", "Skip compile-time tests"

  depends_on "linuxbrew/xorg/wayland" => :build
  depends_on "pkg-config" => :build

  if build.head?
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-silent-rules
    ]

    system "autoreconf", "-fiv" if build.head?
    system "./configure", *args
    system "make"
    system "make", "check" if build.with? "test"
    system "make", "install"
  end
end
