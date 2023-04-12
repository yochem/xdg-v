module xdg


fn test_path_from_var() ? {
	assert path_from_env('409834928344') or {'error'} == 'error'
}

fn test_cache() {
	assert cache_home() == '/Users/yochem/Library/Caches'
}
