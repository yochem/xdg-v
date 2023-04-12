module xdg
// xdg implements the XDG Base Directory Specification (version 0.8) by the
// Free Desktop organisation (freedesktop.org). The full specification can be
// found on
// https://specifications.freedesktop.org/basedir-spec/basedir-spec-0.8.html.
//
// The specification specifies where applications should look for files,
// depending on their use-case. All these locations can be set using
// environment variables.

import os
import pathlib { path, Path }

fn path_from_env(var string) ?Path {
	env_var := os.getenv(var)

	if env_var == '' {
		return none
	}

	var_path := path(env_var).resolve()

	if path(var_path).is_absolute() {
		return env_var
	}

	return none
}

fn paths_from_env(var string) ?[]Path {
	env_var := os.getenv(var)

	paths := env_var.split(':').map(path(it).resolve).filter(it.is_absolute())

	if paths.len > 0 {
		return paths
	}

	return none
}

// cache_home is the base directory for user-specific date files.
// The environment variable `$XDG_CACHE_HOME` controls the return value of this
// function. When the variable is either not set or empty, a default equal to
// `$HOME/.cache` is returned.
pub fn cache_home() Path {
	return path_from_env('XDG_CACHE_HOME') or {
		path('~/.cache').resolve()
	}
}

// config_dirs is the preference-ordered set of base directories to
// search for configuration files in addition to the `$XDG_CONFIG_HOME` base
// directory.
// The environment variable `$XDG_CACHE_HOME` controls the return value of this
// function. When the variable is either not set or empty, a default equal to
// `/etc/xdg` is returned.
pub fn config_dirs() []Path {
	return path_from_env('XDG_CONFIG_DIRS') or {
		[path('/etc/xdg')]
	}
}

// config_home is the base directory for user-specific configuration files.
// The environment variable `$XDG_CONFIG_HOME` controls the return value of this
// function. When the variable is either not set or empty, a default equal to
// `$HOME/.config` is returned.
pub fn config_home() Path {
	return path_from_env('XDG_CONFIG_HOME') or {
		path('~/.config').resolve()
	}
}

// data_dirs defines the preference-ordered set of base directories to search
// for data files in addition to the `$XDG_DATA_HOME` base directory. If
// $XDG_DATA_DIRS is either not set or empty, a value equal to
// /usr/local/share/:/usr/share/ should be used.
pub fn data_dirs() []Path {
	return path_from_env('XDG_DATA_DIRS') or {
		[path('/usr/local/share'), path('/usr/share/')]
	}
}

// data_home is the base directory for user-specific date files.
// The environment variable `$XDG_DATA_HOME` controls the return value of this
// function. When the variable is either not set or empty, a default equal to
// `$HOME/.local/share` is returned.
pub fn data_home() Path {
	return path_from_env('XDG_DATA_HOME') or {
		path('~/.local/share').resolve()
	}
}

// $XDG_RUNTIME_DIR defines the base directory relative to which user-specific
// non-essential runtime files and other file objects (such as sockets, named
// pipes, ...) should be stored. When the variable is either not set or empty,
// no default value is returned (the return value is optional).
pub fn runtime_dir() ?Path {
	return path_from_env('XDG_RUNTIME_DIR')?
}

// state_home is the base directory for user-specific state files.
// The environment variable `$XDG_STATE_HOME` controls the return value of this
// function. When the variable is either not set or empty, a default equal to
// `$HOME/.local/state` is returned.
pub fn state_home() Path {
	return path_from_env('XDG_STATE_HOME') or {
		path('~/.local/state').resolve()
	}
}
