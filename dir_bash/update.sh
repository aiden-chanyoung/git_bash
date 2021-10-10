#!/bin/bash

path=/afs/mics.snu.ac.kr/user/chanyoung/bash_script/git_bash/dir_bash

for value in lib/*
do
    # check individual ips
    if [ $value = lib/adc ]
    # if [ $value = lib/adc ] || [ $value = lib/ip2 ]
    then
        # =========================================
        # check latest ip
        # max  : latest date
        # rev  : latest rev
        # nrev : new (nex) rev
        # =========================================
        max=0
        rev=0
        for x in $value/*
        do
            n=${x##*/}
            [ "$((n))" -gt "$max" ] && max=$n

            r=$(echo $n | sed 's/^\(...\).*/\1/')
            #echo $x $n $r

            if [ $r = rev ]
            then
                f=${n: -2}
                #echo $f
            fi
            [ "$((f))" -gt "$rev" ] && rev=$f
        done

        nrev=$( printf '%02d' "$(($rev + 1))" )
        echo $value : latest data [$max] latest rev[$rev] next rev[$nrev]

        # make new rev directory
        mkdir ./$value/rev$nrev

        # =========================================
        # check version
        # IP name, FE version, DOC version
        # =========================================
        # get IP name
        IP=$(basename $(find ./$value/$max -name 'sf*'))
        FE=$(basename $(find ./$value/$max -name 'FE*'))
        DC=$(basename $(find ./$value/$max -name 'DOC*'))

        echo IP : $IP > ./$value/rev$nrev/version
        echo [$max] FE : $FE, DOC : $DC >> ./$value/rev$nrev/version

        # =========================================
        # generate link 
        # ADC : TB_FUNCTION, VCS, doc, synopsys
        # =========================================
        ln -s $path/$value/$max/$FE/TB_FUNCTION $path/$value/rev$nrev/TB_FUNCTION
        ln -s $path/$value/$max/$FE/VCS $path/$value/rev$nrev/VCS
        ln -s $path/$value/$max/$FE/synopsys $path/$value/rev$nrev/synopsys
        ln -s $path/$value/$max/$DC $path/$value/rev$nrev/doc

        # =========================================
        # generate empty file and inc file
        # =========================================
        VF=$(ls $path/$value/rev$nrev/VCS )
        :mk.empty_module $VF
        mv *.v.empty $path/$value/rev$nrev

        echo -e '`timescale 1ns/1ps\n' > ${VF%%.*}.inc
        echo '`ifdef' $(echo ${VF%%.*} | tr [:lower:] [:upper:])'_EMPTY' >> ${VF%%.*}.inc
        echo '  `include "./'$VF'.empty"' >> ${VF%%.*}.inc
        echo '`else' >> ${VF%%.*}.inc
        echo '  `ifdef VCS' >> ${VF%%.*}.inc
        echo '    `include "./VCS/'$VF'"' >> ${VF%%.*}.inc
        echo '  `else' >> ${VF%%.*}.inc
        echo '    `include "./VCS/'$VF'"' >> ${VF%%.*}.inc
        echo '  `endif' >> ${VF%%.*}.inc
        echo '`endif' >> ${VF%%.*}.inc

        mv *.inc $path/$value/rev$nrev

        # =========================================
        # generate final link 
        # =========================================
        rm -rf $path/$value/final
        ln -s $path/$value/rev$nrev $path/$value/final
    fi

done
