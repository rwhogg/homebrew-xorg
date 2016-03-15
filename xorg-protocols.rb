class XorgProtocols < Formula
  desc "Xorg Protocols"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url      "https://raw.githubusercontent.com/Linuxbrew/homebrew-xorg/master/README.md"
  version  "latest"
  sha256   "846477dd316964fe52e9f73c3752d3c0383f7099046dd06ddfda92c2f9baad5d"
  # tag "linuxbrew"

  depends_on "xorg-sgml-doctools" => [:build, :recommended]
  depends_on "fop"                => [:build, :optional]
  depends_on "libxslt"            => [:build, :optional]
  depends_on "xmlto"              => [:build, :optional]
  depends_on "asciidoc"           => [:build, :optional]

  args = %W[]
  args << "without-xorg-sgml-doctools" if build.without?("xorg-sgml-doctools")
  args << "with-fop"                   if build.with?("fop")
  args << "with-libxslt"               if build.with?("libxslt")
  args << "with-xmlto"                 if build.with?("xmlto")
  args << "with-asciidoc"              if build.with?("asciidoc")

  res = %w[bigreqsproto compositeproto damageproto dmxproto dri2proto dri3proto fixesproto fontsproto glproto inputproto kbproto presentproto randrproto recordproto renderproto resourceproto scrnsaverproto videoproto xcmiscproto xextproto xf86bigfontproto xf86dgaproto xf86driproto xf86vidmodeproto xineramaproto xproto]

  res.each do |r|
    depends_on r => args
  end

  def install
    ohai "Xorg Protocols have been installed!"
    prefix.install "README.md" => "xorg-protocols.md"
  end
end
