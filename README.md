# Prakhar’s dotfiles

This is a copy of my own dotfiles, based off [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles) but heavily modified for my own use, with many, many changes to suit my work. If you're looking for a template for your own dotfiles, you'll probably want to use Mathias's repository instead.

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/repos/dotfiles`.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/prakharbahuguna/dotfiles.git && dotfiles/bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository, `git pull` the latest changes, and then re-run the script:

```bash
./bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
./bootstrap.sh -f
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/prakharbahuguna/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Sensible MacOS defaults

When setting up a new Mac, you may want to set some sensible MacOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

### Setup Visual Studio Code

To install the settings file and extensions for Visual Studio Code:

```bash
./vscode.sh
```

While this dotfiles repo is primarily targeted at MacOS since that’s where I spend most of my time, it should also work fine on Ubuntu.
