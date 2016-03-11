# Linuxbrew Xorg


[Xorg libraries](http://www.x.org/wiki/guide/client-ecosystem/) for Linuxbrew users

## Install

```bash
brew tap linuxbrew/homebrew-xorg &&
brew install xorg
```

This will install (all) Xorg libraries. It does take time. To see the progress of the installation enable verbose messaging by providing `-v` (`--verbose`) flag:

```bash
brew install -v xorg
```

You can also install individual libraries/packages  provided in this tap by running

```bash
brew install <formula-name>
```

## Requirements

Main dependencies of the Xorg libraries are:
  * `fontconfig`
  * `autoconf`
  * `pkg-config`
  * `python` (`python2` or `python3`)

To build documentation (enabled with `--with-docs` flag), the following packages are required:
  * `xorg-sgml-doctools` (recommended, installed by default)
  * `fop`<sup>1</sup> 
  * `libxslt`
  * `xmlto`
  * `asciidoc`
  * `w3m`<sup>2</sup>

*1*: reciprocal dependency is not resolved at the present time but it does not affect the build process
*2*: currently does not build on Linux

## Details

Installation proceeds according to the instructions from [Linux From Scratch](http://www.linuxfromscratch.org/blfs/view/stable/x/x7lib.html)

To build documentation, use `--with-docs` flag, _i.e._:

```bash
brew install xorg --with-docs
```

To use `python3` when building `xcb-proto` package, use `--with-python3` flag, _i.e._:

```bash
brew install xorg --with-python3
```

To issue `make check` before `make install` where applicable, use `--with-check` flag, _i.e._:

```bash
brew install xorg --with-check
```

You can also build static libraries (though, this is neither required nor recommended) using `--with-static` flag, _i.e._:

```bash
brew install xorg --with-static
```

## Issues

Currently, reciprocal dependency with `fop`
