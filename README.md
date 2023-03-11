```
:: my preferred ~/ ::

CONTENTS:
bash             -- i mean, if i have to
editrc           -- ^ but for osx which uses libedit
inputrc          -- sets vi mode for readline programs
zshrc            -- preferred shell configuration
confiy/          -- stuff that goes in the ~/.config dir
confiy/alacritty -- terminal settings
confiy/i3        -- i3 configuration
confiy/nvim      -- neovim config, generally intended to be ide-like

MAINTENANCE:
symlink_all.sh   -- initial setup, run to (re)set or add new symlinks
preprocess.sh    -- runs stuff in _preprocessing based on _params

SPECIAL:
_preprocess/     -- determines compatability, performs templating, etc
_bin/            -- fun executable things to add to $PATH
_params/         -- customize preprocessing based on system hostname
```
