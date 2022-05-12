#!/bin/bash
Path="./test_cases"

Build_and_Execute () {
    ProblemNumber="$(find ./ -maxdepth 1 -name '*.cpp' -type f -print -quit | grep -Po '\d+')"
    if g++ -fdiagnostics-color=always -pedantic-errors -std=c++11 -g "${ProblemNumber}".cpp -o "${ProblemNumber}"
    then
        for file in $(ls ${Path} | grep in)
        do
            if [ -f ${Path}/"${file}" ]
            then
                Number="$(ls ${Path}/"${file}" | grep -Po '\d+_\d+')"
                    ./"$ProblemNumber" < ${Path}/"${Number}".in > myoutput"${Number}".txt
                    if diff myoutput"${Number}".txt ${Path}/"${Number}".out --strip-trailing-cr 1>/dev/null 2>&1
                    then
                        echo Testcase "${Number}" Passed
                        rm myoutput"${Number}".txt
                    else
                        echo Testcase "${Number}" Failed
                        diff --color myoutput"${Number}".txt ${Path}/"${Number}".out 
                    fi
            fi
        done
    else
        echo "g++ Compile failed!"
    fi
}

Build_and_Execute_C () {
    ProblemNumber="$(find ./ -maxdepth 1 -name '*.c' -type f -print -quit | grep -Po '\d+')"
    if gcc -fdiagnostics-color=always -pedantic-errors -std=c11 -g "${ProblemNumber}".c -o "${ProblemNumber}"
    then
        for file in $(ls ${Path} | grep in)
        do
            if [ -f ${Path}/"${file}" ]
            then
                Number="$(ls ${Path}/"${file}" | grep -Po '\d+_\d+')"
                ./"$ProblemNumber" < ${Path}/"${Number}".in > myoutput"${Number}".txt
                if diff myoutput"${Number}".txt ${Path}/"${Number}".out --strip-trailing-cr 1>/dev/null 2>&1
                then
                    echo Testcase "${Number}" Passed
                    rm myoutput"${Number}".txt
                else
                    echo Testcase "${Number}" Failed
                    diff --color myoutput"${Number}".txt ${Path}/"${Number}".out 
                fi
            fi
        done
    else
        echo "gcc Compile failed!"
    fi
}


for file in ./*.cpp
do
    if [ -e "$file2" ] && [ -e ${Path} ]
    then
        Build_and_Execute
        break
    else
        for dir in *
        do
            if test -d "$dir"
            then
                cd ./"$dir" || exit
                for file2 in ./*.cpp
                do
                if [ -e "$file2" ] && [ -e ${Path} ]
                then
                    echo C++ Problem "$(echo "${dir}" | grep -Po '\d+')":
                    Build_and_Execute
                    echo
                    
                fi
                
                cd ../
                done
            fi
        done
        break
    fi
done

for file in ./*.c
do
    if [ -e "$file2" ] && [ -e ${Path} ]
    then
        Build_and_Execute
        break
    else
        for dir in *
        do
            if test -d "$dir"
            then
                cd ./"$dir" || exit
                for file2 in ./*.c
                do
                if [ -e "$file2" ] && [ -e ${Path} ]
                then
                    echo C Problem "$(echo "${dir}" | grep -Po '\d+')":
                    Build_and_Execute_C
                    echo
                fi
                cd ../
                done
            fi
        done
        break
    fi
done
