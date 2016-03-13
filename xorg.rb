class Xorg < Formula
  desc "Xorg Libraries"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url      "http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html"
  version  "latest"
  sha256   "6968c96792cd482df425fc79dfd90b55cbe92f73da29bc2381edf0a889041865"
  # tag "linuxbrew"

  option "with-check",      "Run a check before install (for all packages)"
  option "with-static",     "Build static libraries"
  option "with-docs",       "Build documentation (where applicable)"
  # option "with-devel-docs", "Build libXfont  with text documentation"
  option "with-python3",    "Build xcb-proto with python3 (defaul python is used otherwise)"

  depends_on "fontconfig"         => :build
  depends_on "xorg-sgml-doctools" => [:build, :recommended]

  if build.with?("python3")
    depends_on :python3      => :build
  else
    depends_on :python       => :build
  end

  args = %W[]
  args << "with-check"  if build.with?("check")
  args << "with-static" if build.with?("static")

  if build.with?("docs")
    depends_on "xorg-docs"          => [:build, :recommended]
    depends_on "fop"                => [:build, :recommended]
    depends_on "libxslt"            => [:build, :recommended]
    depends_on "xmlto"              => [:build, :recommended]
    depends_on "asciidoc"           => [:build, :optional]
  end

  args << "without-xorg-sgml-doctools" if build.without?("xorg-sgml-doctools")
  args << "with-fop"                   if build.with?("fop")
  args << "with-libxslt"               if build.with?("libxslt")
  args << "with-xmlto"                 if build.with?("xmlto")
  args << "with-asciidoc"              if build.with?("asciidoc")

  res = %w[xtrans libx11 libxext libfs libice libsm libxscrnsaver libxt libxmu libxpm libxaw libxfixes libxcomposite libxrender libxcursor libxdamage libfontenc libxfont libxft libxi libxinerama libxrandr libxres libxtst libxv libxvmc libxxf86dga libxxf86vm libdmx libpciaccess libxkbfile libxshmfence]

  res.each do |r|
    if r == "libxfont"
      args2 = args
      args2 << "--with-devel-docs" if build.with?("docs")
      depends_on r => args2
    elsif r == "xtrans"
      args2 = args
      args2 << "--with-docs" if build.with?("docs")
      depends_on r => args2
    elsif r == "xcb-proto"
      args2 = args
      args2 << "--with-python3" if build.with?("python3")
      depends_on r => args2
    else
      depends_on r => args
    end
  end

  def install
    ohai "Xorg Protocols have been installed!"
    prefix.install "x7lib.html"
  end
end
