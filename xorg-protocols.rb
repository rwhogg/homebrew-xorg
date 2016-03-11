class XorgProtocols < Formula
  desc "Xorg Protocols"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url      "http://www.linuxfromscratch.org/blfs/view/svn/x/x7proto.html"
  version  "latest"
  sha256   "86a38ed2e74606387b9e79cbd8760f9ede8dbdabb6c8c05480f2f00905803182"
  # tag "linuxbrew"

  depends_on "xorg-sgml-doctools" => [:build, :recommended]
  depends_on "fop"                => [:build, :optional]
  depends_on "libxslt"            => [:build, :optional]
  depends_on "xmlto"              => [:build, :optional]
  depends_on "asciidoc"           => [:build, :optional]

  args  = %W[]
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
    prefix.install "x7proto.html"
  end

end
