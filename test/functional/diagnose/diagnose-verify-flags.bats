#!/usr/bin/env bats

# Author: Castulo Martinez
# Email: castulo.martinez@intel.com

load "../testlib"

@test "Verify conflicting flags" {

	# Some flags are mutually exclusive

	# --quick & --picky
	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --quick --picky"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --picky and --quick together"

	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --picky --quick"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --quick and --picky together"

	# --quick & --extra-files-only
	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --quick --extra-files-only"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --extra-files-only and --quick together"

	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --extra-files-only --quick"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --quick and --extra-files-only together"

	# --picky & --extra-files-only
	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --picky --extra-files-only"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --extra-files-only and --picky together"

	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --extra-files-only --picky"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --picky and --extra-files-only together"

	# --fix & --install
	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --fix --install"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --install and --fix together"

	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --install --fix"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --fix and --install together"

	# --picky & --install
	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --picky --install"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --install and --picky together"

	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --install --picky"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --picky and --install together"

	# --extra-files-only & --install
	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --extra-files-only --install"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --install and --extra-files-only together"

	run sudo sh -c "$SWUPD verify $SWUPD_OPTS --install --extra-files-only"
	assert_status_is "$SWUPD_INVALID_OPTION"
	assert_in_output "Error: You cannot use --extra-files-only and --install together"

}