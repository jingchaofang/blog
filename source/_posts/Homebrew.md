---
title: Homebrew
date: 2017-11-20 19:30:18
tags:
---

# [Site](https://brew.sh/) / [Github](https://github.com/Homebrew/brew/)

The missing package manager for macOS
macOS 缺失的软件包管理器

## Install Homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Paste that at a Terminal prompt.
将以上命令粘贴至终端。

The script explains what it will do and then pauses before it does it. There are more installation options [here](https://docs.brew.sh/Installation.html).
脚本会在执行前暂停，并说明它将做什么。高级安装选项在这里。

## What Does Homebrew Do?

Homebrew installs [the stuff you need](https://github.com/Homebrew/homebrew-core/tree/master/Formula) that Apple didn’t.
使用Homebrew安装Apple没有预装但你需要的东西。

```bash
$ brew install wget
```

Homebrew installs packages to their own directory and then symlinks their files into /usr/local.
Homebrew会将软件包安装到独立目录，并将其文件软链接至/usr/local 。

```bash
$ cd /usr/local
$ find Cellar
Cellar/wget/1.16.1
Cellar/wget/1.16.1/bin/wget
Cellar/wget/1.16.1/share/man/man1/wget.1

$ ls -l bin
bin/wget -> ../Cellar/wget/1.16.1/bin/wget
```

Homebrew won’t install files outside its prefix, and you can place a Homebrew installation wherever you like.
Homebrew不会将文件安装到它本身目录之外，所以您可将Homebrew安装到任意位置。

Trivially create your own Homebrew packages.
轻松创建你自己的Homebrew包。

```bash
$ brew create https://foo.com/bar-1.0.tgz
Created /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/bar.rb
```

It's all git and ruby underneath, so hack away with the knowledge that you can easily revert your modifications and merge upstream updates.
完全基于git和ruby，所以自由修改的同时你仍可以轻松撤销你的变更或与上游更新合并。

```bash
$ brew edit wget # opens in $EDITOR!
```

Homebrew formulae are simple Ruby scripts:
Homebrew的配方都是简单的Ruby脚本：

```bash
class Wget < Formula
  homepage "https://www.gnu.org/software/wget/"
  url "https://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz"
  sha256 "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
```

Homebrew complements macOS. Install your gems with gem, and their dependencies with brew.
Homebrew使macOS更完整。使用gem来安装gems、用brew来安装那些依赖包。

## Further Documentation [docs.brew.sh](https://docs.brew.sh/)


**Taps (third-party repositories)**

brew tap adds more repositories to the list of formulae that brew tracks, updates, and installs from. By default, tap assumes that the repositories come from GitHub, but the command isn’t limited to any one location.

The command (brew tap)

* brew tap without arguments lists the currently tapped repositories. For example:

```bash
$ brew tap
homebrew/core
mistydemeo/tigerbrew
dunn/emacs
```

* brew tap <user/repo> makes a shallow clone of the repository at https://github.com/user/repo . After that, brew will be able to work on those formulae as if they were in Homebrew’s canonical repository. You can install and uninstall them with brew [un]install, and the formulae are automatically updated when you run brew update. (See below for details about how brew tap handles the names of repositories.)

## Community Discussion

[discourse.brew.sh](https://discourse.brew.sh/)

## Homebrew Blog

[brew.sh/blog](https://brew.sh/blog/)

## Homebrew Packages

[formulae.brew.sh](http://formulae.brew.sh/)

formulae.brew.sh is an online package browser for Homebrew – the macOS package manager.

## Analytics Data

[brew.sh/analytics](https://brew.sh/analytics/)

### [Install Events](https://brew.sh/analytics/install/)

The top formulae that have been installed either directly or pulled in as a dependency.

### [Install On Request Events](https://brew.sh/analytics/install-on-request/)

The top formulae that have been installed on request (i.e. not pulled in as a dependency)

### [Build Error Events](https://brew.sh/analytics/build-error/)

The top formulae which have build errors. Note these also include unsupported Homebrew configurations.




# Homebrew Cask

https://caskroom.github.io/

https://github.com/caskroom/homebrew-cask

“To install, drag this icon…” no more!

Homebrew-Cask extends Homebrew and brings its elegance, simplicity, and speed to macOS applications and large binaries alike.

It only takes 1 line in your shell to reach 3500 Casks maintained by 2500 contributors.

## Get Homebrew-Cask

```bash
brew tap caskroom/cask
```

## Install with ease

Your software is just one command away from being ready and raring to go.
Forget all about babysitting the install process step by step, from website to cleanup.

```bash
$ brew cask install google-chrome
```

## Unix-savvy, macOS-friendly

Homebrew-Cask does one thing, does it well, and plays nice with others. Apps are moved to your /Applications folder in the same way as you would manually.
Or wherever you like: Homebrew-Cask is fully configurable.

```bash
$ ls /usr/local/Caskroom
google-chrome
```

## Community-driven

Creating new Casks is only a matter of minutes; updating them, of seconds!
And if you feel like improving Homebrew-Cask itself, dive into the codebase and you'll find yourself right at home: Homebrew-Cask is all git and Ruby, just like Homebrew.

```bash
brew cask create my-cask
```


