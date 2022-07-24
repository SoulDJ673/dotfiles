se() {
	nvim "$(du -a ~/.local/bin | cut -f2 | sk)";
	return 0;
}

ce() {
	nvim "$(du -a ~/.config | cut -f2 | sk)";
	return 0;
}
