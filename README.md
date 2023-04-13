# XDG

This module implements the XDG Base Directory Specification (the newest
version, currently version 0.8) by the Free Desktop organisation
(freedesktop.org). The full specification can be found on
https://specifications.freedesktop.org/basedir-spec/basedir-spec-0.8.html.

The specification specifies where applications should look for files, depending
on their use-case. All these locations can be set using environment variables.

## Install

```shell
$ v install yochem.xdg
```

## Usage

Environment Variable | `v`             | Default return value
---------------------|-----------------|------------------------------------
`$XDG_CACHE_HOME`    | `cache_home()`  | `'$HOME/.cache'`
`$XDG_CONFIG_HOME`   | `config_home()` | `'$HOME/.config'`
`$XDG_DATA_HOME`     | `data_home()`   | `'$HOME/.local/share'`
`$XDG_STATE_HOME`    | `state_home()`  | `'$HOME/.local/state'`
`$XDG_CONFIG_DIRS`   | `config_dirs()` | `['/etc/xdg']`
`$XDG_DATA_DIRS`     | `data_dirs()`   | `['/usr/local/share', '/usr/share']`
`$XDG__RUNTIME_DIR`  | `runtime_dir()` | `none`


## pathlib branch

I'm currently working on a `pathlib` module in vlib, see
https://github.com/vlang/v/pull/16782. For now, this repo has a pathlib branch
to show how that would look. This branch will be the default when vlang/v#16782
is finished and merged.


## License

MIT.
