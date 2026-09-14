#!/bin/sh
# Launches the AltServer built from the classic-based branch (derived data in build-classic).
#
# AltSign-Dynamic resolves its alt_cc* crypto symbols at load time, and this build provides
# them via an injected dylib, so AltServer must be started through this script rather than
# by double-clicking the .app.
cd "$(dirname "$0")"
export DYLD_INSERT_LIBRARIES="$PWD/build/libaltcorecrypto.dylib"
exec build-classic/Build/Products/Release/AltServer.app/Contents/MacOS/AltServer "$@"
