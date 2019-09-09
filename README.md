# Linuxbrew Xorg


[Xorg libraries][xorg-libs] for Homebrew on Linux.

## How to use

First, you need to "tap" this repository with

```sh
brew tap linuxbrew/xorg
```

and then you can either install the entire suite of libraries (not recommended) with:

```sh
brew install linuxbrew/xorg/xorg
```

or install individual libraries, for example:

```sh
brew install linuxbrew/xorg/libx11 linuxbrew/xorg/mesa
```

## About this tap

Installation proceeds according to the instructions from [Linux From Scratch][lfs].

You _can_ build static libraries using `--with-static` flag, though this is neither required nor recommended, _i.e._:

```sh
brew install xorg --with-static
```

## How to contribute

### Out-of-date formula

Submit a Pull Request!

If you have `hub` installed (`brew install hub` if you don't) and set up,
you can do this in one step:

```sh
brew bump-formula-pr --url=NEW-URL linuxbrew/xorg/FORMULA
```

### No formula

Submit a Pull Request!

Please feel free to submit pull requests to add new formulae to this tap.
The goal of this repo is to be a one-stop shop for all X11-related needs of Homebrew on Linux.

### Incomplete Documentation

Submit a Pull Request!

### Something else

Please report any issues using... well, GitHub Issues!

[lfs]: http://www.linuxfromscratch.org/blfs/view/stable/x/x7lib.html
[xorg-libs]: http://www.x.org/wiki/guide/client-ecosystem
