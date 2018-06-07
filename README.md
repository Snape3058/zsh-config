# What the Zsh

This repo stores the configuration of my oh-my-zsh customization.

[toc]

## Initiation

Run the Initiate script: `scripts/init.sh`

The script will link all the files required to the proper directory.

## Directory Tree

There are 3 sub-directories in the repo: `config`, `scripts` and `themes`.
The `config` directory stores the configuration scripts. The `scripts`
directory stores the scripts required to be loaded or executed. The
`themes` directory stores the zsh theme files.

### Configurations

The files and directories in this directory are named like `nn-xxxxxx.zsh`.
The name starts with a 2-digit order number, which is used to define the
order when loading the files. The files or directories with littler number
will be loaded first. After the order number and a dash, is the name of the
script, which can be defined with any length. Finally, the name ends with
".zsh".

There also some specific scripts that are pre-installed. The `00-env.zsh`
stores the environment variable that should be set ahead of time. The
name aliasing are located in directory `10-alias.zsh` and the functions
are located in directory `20-function.zsh`.

The local aliases are stored in file `10-alias.zsh/local.zsh`. The local
functions are stored in directory `20-functions.zsh/local.zsh/`.

### Scripts

The scripts in the directory including: the zshrc file, the load script used
to load the files in `config` and the initiation script.

### Themes

The superior "puella" theme is located in the `themes` directory.
