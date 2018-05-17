# Workstation Dotfiles

This is a collection of development configuration files to help with automating
customatization of a new or restored workstation.  It is specific to a BASH
environment.

It is intended to be checked out into a bare $HOME/.dotfiles git repository:

```bash
git clone --bare git@github.com:jpartlow/dotfiles $HOME/.dotfiles
```

...and then accessed through an aliased git that sets the --git-dir=$HOME/.dotfiles
and the --work-tree=$HOME, so that the dotfiles are directly managed as source
control without any additional symlinking.

This is from Nicola Paolucci's work:
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

The BASH alias used for this is:

```bash
function dotfiles {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
```

## Bootstrapping

Because we're cloning into a bare repository there is a first bootstrapping
step needed:

```bash
git clone --bare git@github.com:jpartlow/dotfiles $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

This ignores the possibility of conflicts with existing default dotfiles.
