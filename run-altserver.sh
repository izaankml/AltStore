#!/bin/sh
# Launches the patched AltServer (sshane/AltStore macos-26-27 + local fixes).
#
# The AltSign-Dynamic framework resolves its alt_cc* crypto symbols at load
# time, and this build provides them via an injected dylib — so AltServer must
# be started through this script, not by double-clicking the .app. Launching
# the .app directly will segfault on the first Apple ID sign-in.
cd "$(dirname "$0")"
export DYLD_INSERT_LIBRARIES="$PWD/build/libaltcorecrypto.dylib"
exec build/Build/Products/Release/AltServer.app/Contents/MacOS/AltServer "$@"
