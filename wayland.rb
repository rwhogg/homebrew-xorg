class Wayland < Formula
  desc "A protocol for a compositor to talk to its clients"
  homepage "https://wayland.freedesktop.org"
  url "https://wayland.freedesktop.org/releases/wayland-1.10.93.tar.xz"
  sha256 "a0fbe4e27f6a09ee251e1326f0a17ac8159cdbd894c1e6190ee64c3d37086836"

  bottle do
    sha256 "3bf01bfe3ae2090fcd3444a925c546aec8e0528d8b46d5d2b9e418c96246fd61" => :x86_64_linux
  end

  head do
    url "git://anongit.freedesktop.org/wayland/wayland"
  end

  option "with-static", "Build static libraries (not recommended)"
  option "without-test", "Skip compile-time tests"

  depends_on "pkg-config"  => :build
  depends_on "expat"
  depends_on "libffi"
  depends_on "autoconf" if build.head?
  depends_on "libxml2"

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --disable-documentation
    ]

    args << "--enable-static=#{build.with?("static") ? "yes" : "no"}"

    if build.head?
      system "./autogen.sh", *args
    else
      system "./configure", *args
    end
    system "make"
    ENV.deparallelize
    system "make", "check" if build.with?("test")
    system "make", "install"
  end
end
