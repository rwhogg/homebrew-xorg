class Xinput < Formula
  desc "Utility to configure and test X input devices"
  homepage "https://gitlab.freedesktop.org/xorg/app/xinput"
  url "https://www.x.org/pub/individual/app/xinput-1.6.3.tar.bz2"
  sha256 "35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed"

  bottle do
    cellar :any_skip_relocation
    sha256 "390c65597d14a0cb98df011aeeaaf494ccabfb6eadda0047cc0aec6d27f20cc8" => :x86_64_linux
  end

  head do
    url "https://gitlab.freedesktop.org/xorg/app/xinput.git"
  end

  depends_on "linuxbrew/xorg/xorgproto" => :build
  depends_on "pkg-config" => :build
  depends_on "linuxbrew/xorg/libx11"
  depends_on "linuxbrew/xorg/libxext"
  depends_on "linuxbrew/xorg/libxi"
  depends_on "linuxbrew/xorg/libxinerama"
  depends_on "linuxbrew/xorg/libxrandr"

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    assert_predicate bin/"xinput", :exist?
    assert_equal %Q(.TH xinput 1 "xinput #{version}" "X Version 11"),
      shell_output("head -n 1 #{man1}/xinput.1").chomp
  end
end
