#!/bin/bash

source $(dirname $0)/../defs.sh

source $(dirname $0)/../../env/bin/activate

export PYTHONPATH=$PYTHONPATH:$CTAKES_NEURAL/scripts

subdir=`dirname $0`

python $(dirname $0)/../$PREDICT_SCRIPT $*

ret=$?

deactivate

exit $ret
