#!/usr/bin/env bats

load "../../swupdlib"

setup() {
  clean_test_dir
  create_manifest_tar 10 MoM
  create_manifest_tar 10 os-core
}

teardown() {
  clean_tars 10
}

@test "bundle-add list bundles" {
  run sudo sh -c "$SWUPD bundle-add $SWUPD_OPTS --list"

  check_lines "$output"
}

# vi: ft=sh ts=8 sw=2 sts=2 et tw=80
