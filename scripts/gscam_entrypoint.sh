#!/bin/bash -x

. /workspace/gscam/install/setup.sh
export GSCAM_CONFIG="videotestsrc pattern=snow ! video/x-raw,width=1280,height=720 ! videoconvert"
exec "$@"