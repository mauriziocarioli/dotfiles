dotfiles
=====

# Index
* [Installation](#installation)
* [Upgrading](#upgrading)
* [Usage](#usage)
    * [Using solarized color scheme](#solarized-scheme)
    * [Host specific settings](#host-specific-settings)
    * [Font (RobotoMono Nerd Font Mono)](#font)
    * [rxvt-unicode terminal](#rxvt-unicode)
* [Recommended Software](#recommended-software)
* [Caveats](#caveats)
    * [Tmux](#tmux)
    * [Multiple Terminals Open](#multiple-terminals-open)
    * [KDE](#kde)
* [Submodules](#submodules)

# Installation

## Clone the repository
```bash
$ git clone git://github.com/olsonbg/dotfiles.git ~/dotfiles
```

## Get and update the submodules

The submodules will have to be updated when this repository is first cloned,
and whenever it is updated.

Initialize the submodules list in .gitmodules by recording them in .git/config.

```bash
$ git submodule init
```

Update the registered submodules to match what the dotfiles project expects

```bash
$ git submodule update
```

The previous two commands can be combined into one by

```bash
$ git submodule update --init
```

## Create symlinks
Current dotfiles are backed up to the `~/dotfiles-<datetime>` directory,
where `<datetime>` is the current date and time.

```bash
$ ~/dotfiles/makesymlinks.sh
```

To activate the new settings, it's easiest to open a new terminal. Methods
to activate the new settings in a currently running terminal vary, but one
of the following commands may work
```
. ~/.bash_profile
. ~/.bashrc
```

## Get most recent version of each bundled submodule

Update all registered submodules to their most recent commit. **Note**: This
may bring the submodules to newer versions than may be expected by the
dotfiles repository.

```bash
$ git submodule foreach git pull origin master
```

# Usage
## Solarized scheme
When first installed, the light
[solarized](https://github.com/altercation/solarized) color scheme is used.
The light or dark color schemes can be selected by using the
`solarized-light` or `solarized-dark` commands, respectively. The command
`solarized` will toggle between solarized-dark and solarize-light schemes.
The new color scheme will take effect immediately, with a few
[caveats](#caveats).

The `solarized` command writes a single line to the
.Xresources.d/current-scheme file, either
```bash
#define SOLARIZED_LIGHT
```
or
```bash
#define SOLARIZED_DARK
```

This file is loaded first in the .Xresources file, followed by a series of
`#ifdef` statements which load the correct solarized scheme.

### Solarized color schemes included
* Vim
* Tmux
* ls (dircolors)
* Any program which makes use of xrdb resources (most terminals)

## Host Specific Settings

Settings for each host (computer) can be placed in the directory returned by
`MyPersonalConfigs -d bash`, which is usually
`~/.config/MyPersonalConfigs/bash`. A message is displayed by
`makesymlinks.sh` which tells the user how to populate the directory with
default configuration files.


## Font
The [RobotoMono Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts)
font is used in [xterm](http://invisible-island.net/xterm/), and
[rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html). The font
is included with this repository and symbolically linked to from the
`~/.fonts` directory.

The fallback font is set to `DejaVu Sans Mono`.

## rxvt-unicode
The default font size for the font mentioned [previously](#font) is 13.5,
however, the font size of a currently open terminal can be increased or
decreased with one of the key sequences listed in the following table:


| Key Sequence  | Action                                                     |
| :------------ | :--------------------------------------------------------- |
| Control--     | Decrease font by 1.                                        |
| Control-=     | Increase font by 1.                                        |
| Control-0     | Default font size (13.5).                                  |
| Control-1     | Resize window to 80x40 characters.                         |
| Control-2     | Resize window to 120x40 characters.                        |
| Control-3     | Resize window to 140x45 characters, and move to 40,140 px. |

# Recommended Software

## LXDE
[LXDE](http://lxde.org/) is a lightweight desktop for X11.

## OpenBox

[OpenBox](http://openbox.org/wiki/Main_Page) is a Lightweight window
manager. My custom key bindings are in
[lxde-rc.xml](config/openbox/lxde-rc.xml), and are:

| Key Sequence  | Action                                                                                                                      |
| :------------ | :-------------------------------------------------------------------------------------------------------------------------- |
| Print         | Screen shot of a window clicked, then open it in Gimp.                                                                      |
| Shift-Print   | Screen shot of entire desktop, then open it in Gimp.                                                                        |
| Win-Space     | Activate LXpanel menu                                                                                                       |
| Win-Return    | Open a new urxvt terminal using [bin/urxvtc-d](bin/urxvtc-d) on Desktop 1, and go there.                                    |
| Win-r         | Resize current window                                                                                                       |
| Win-m         | Move current window                                                                                                         |
| Win-a         | Launch pavucontrol                                                                                                          |
| Win-c b       | Open a new chromium browser on Desktop 2, and go there.                                                                     |
| Win-c e       | Open gmail (inside chromium) on Desktop 3, and go there. This will not open a new window if one already exists.             |
| Win-c c       | Open google calendar (inside chromium) on Desktop 3, and go there. This will not open a new window if one already exists.   |
| Win-t         | Open Thunderbird on Desktop 3, and go there. This will not open a new window if one already exists.   |

## Conky

[Conky](https://github.com/brndnmtthws/conky) is a lightweight system
monitor for X, settings are in [conkyrc](files/conkyrc).  There are color
setting for desktops with dark or light backgrounds in the config file.
Uncomment the one suitable for your desktop, and comment out the others.

## Scrot

[Scrot](https://www.wikipedia.org/wiki/Scrot) is a Screen capture program.
The key bindings, set in [lxde-rc.xml](config/openbox/lxde-rc.xml) and
tabulated in
[OpenBox](#openbox).

## stalonetray

[stalonetray](http://stalonetray.sourceforge.net) is a Stand alone system
tray. The setting are in [stalonetrayrc](files/stalonetrayrc), and will
place the tray in the upper left hand side of screen.

## parcellite

[parcellite](http://parcellite.sourceforge.net/) is a small clipboard
manager.

## Compton

[compton](https://github.com/chjj/compton) is a lightweight, standalone, compositing manager. The setting are in
[compton.config](config/compton.config)

## xdotool

[xdotool](http://www.semicomplete.com/projects/xdotool/) does fake
keyboard/mouse input, window management, and more.

# Caveats

## Tmux
To enable the new color scheme in a currently running tmux session follow
these steps:
  1. Detatch from tmux,
  2. Change the color scheme, with one of the previously listed commands,
  3. reattach to the tmux session.

## Multiple terminals open
When changing the solarized scheme in a terminal, the new scheme will take
effect immediately in that terminal, but not in others that are currently
running. To activate the new colors in other terminals, use either the
`solarized-light` or `solarized-dark` command in each open terminal.

## KDE
To load the Xresources file on KDE login, this small script needs to be
placed in the KDE Autostart directory (~/.kde4/Autostart).
```bash
#!/bin/sh

xrdb ~/.Xresources
```
This script is needed for KDE because it does not process an Xresources file
containing #include directives properly (relative paths don't work). As far
as I know, KDE is the only desktop that needs this _fix_.

# Submodules

Git repositories included as submodules.

* Submodules for Bash
    * [fzf](https://github.com/junegunn/fzf)
* Submodules for VIM
    * [fugitive](https://github.com/tpope/vim-fugitive.git)
    * [fzf](https://github.com/junegunn/fzf.vim)
    * [NERD Commenter](https://github.com/scrooloose/nerdcommenter)
    * [NERD Tree](https://github.com/scrooloose/nerdtree.git)
    * [Pathogen](https://github.com/tpope/vim-pathogen)
    * [Supertab](https://github.com/ervandew/supertab.git)
    * [Syntastic](https://github.com/vim-syntastic/syntastic)
    * [Tabular](https://github.com/godlygeek/tabular)
    * [Tagbar](https://github.com/majutsushi/tagbar)
    * [Tsuquyomi](https://github.com/Quramy/tsuquyomi)
    * [Typescrit-vim](https://github.com/leafgarland/typescript-vim)
    * [vim-airline](https://github.com/bling/vim-airline.git)
    * [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes.git)
    * [vim-Colors-Solarized](https://github.com/altercation/vim-colors-solarized.git)
    * [vim-devicons](https://github.com/ryanoasis/vim-devicons)
        * Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
    * [vim-EasyMotion](https://github.com/easymotion/vim-easymotion)
    * [vim-Javascript](https://github.com/pangloss/vim-javascript)
    * [vim-surround](https://github.com/tpope/vim-surround.git)
    * [VimOutliner](https://github.com/noelhenson/vimoutliner)
