#!/bin/sh
# Launches the AltServer built from the classic-based branch (derived data in build-classic)
# with its output on stdout and stderr, so a run can be redirected to a log file.
cd "$(dirname "$0")"
exec build-classic/Build/Products/Release/AltServer.app/Contents/MacOS/AltServer "$@"
