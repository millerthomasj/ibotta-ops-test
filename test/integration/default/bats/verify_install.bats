# test/integration/default/bats/verify_installed.bats

@test "tmux is installed and in the path" {
  which tmux
}

@test "tmux configuration exists" {
  cat /etc/tmux.conf | grep "map" # this could be a more complex test
}
