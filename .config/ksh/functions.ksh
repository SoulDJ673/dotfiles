se() {
	nvim "$(du -a ~/.local/bin | cut -f2 | sk)";
	return 0;
}
