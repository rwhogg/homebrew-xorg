class XcbProto < Formula
  desc "XML-XCB protocol descriptions that libxcb uses to generate the majority of its code and API"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://xcb.freedesktop.org/dist/xcb-proto-1.11.tar.bz2"
  sha256 "b4aceee6502a0ce45fc39b33c541a2df4715d00b72e660ebe8c5bb444771e32e"
  # tag "linuxbrew"
  
  option "with-check",  "Run a check before install"
  option "with-tests",  "Run tests upon installation"
  option "with-python2","Build with python2"
  option "with-python3","Build with python3"

  # depends_on :autoconf
  depends_on "pkg-config"  => :build

  depends_on :python      => :build if build.with?("python2") || !build.with?("python3")
  depends_on :python3     => :build if build.with?("python3")

  depends_on "libxml2"    => :build if build.with?("tests") # to run tests


  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"

  end
end
