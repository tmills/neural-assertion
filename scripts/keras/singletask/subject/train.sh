#!/bin/bash

source $(dirname $0)/../defs.sh

if [ -z "$GPU" ]
then
    . ~/.profile

    source $(dirname $0)/../../env/bin/activate
    source $(dirname $0)../defs.h

    export PYTHONPATH=$PYTHONPATH:$(dirname $0)/../../:$CTAKES_NEURAL/scripts

    python $(dirname $0)/../$TRAIN_SCRIPT $*

    ret=$?

    deactivate

else
    ret = ssh $GPU "/home/tmill/Projects/neural-assertion/scripts/keras/singletask/subject/train.sh /home/tmill/mnt/hpc/Public/nlp/ch150151/ctakes-assertion/target/models/neural/singletask/train_and_test/subject"
fi

exit $ret