clone() {
  local repo
  repo=$(gh repo list --source --limit 1000 | fzf --exact | cut -f1)
  [ -n "$repo" ] && print -z "gh repo clone $repo"
}
