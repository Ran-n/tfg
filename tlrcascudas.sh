#!/bin/sh

#+ Autor:	Ran#
#+ Creado:	02/04/2021 18:40:32
#+ Editado:	27/07/2021 13:46:20

REP=1

execucion() {
    echo ''
    echo '> Repetición #'$REP
    ./cascudas-vgg16.py -e $epoch -b $batch
    REP=$((REP+1))

    echo '> Repetición #'$REP
    ./cascudas-resnet50.py -e $epoch -b $batch
    REP=$((REP+1))

    echo '> Repetición #'$REP
    ./cascudas-inceptionv3.py -e $epoch -b $batch
    REP=$((REP+1))

}

for dataset in 32 64 128 256; do
     for epoch in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 20 25 30 35 40 45 50; do
        for batch in 8 16 32 64 128 256; do
            execucion
            execucion
            execucion
        done
    done
done
