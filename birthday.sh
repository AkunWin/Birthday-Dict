#! /bin/bash
# Author:Akun
# Time:2022.1.2

# eg:19900606
one=(01 03 05 07 08 10 12)
two=(02)
three=(04 06 09 11)
echo "字典生成中..."
for i in {1960..2003}
do
    for j in {01..12}
    do
        for o in ${one[@]}
        do
            if [ $j -eq $o ]
            then
                for k in {01..31}
                do
                    echo $i$j$k >> dict-birthday.txt
                done
            fi
        done
        for t in ${three[@]}
        do
            if [ $j -eq $t ]
            then
                for k in {01..30}
                do
                    echo $i$j$k >> dict-birthday.txt
                done
            fi
        done
        for e in ${two[@]}
        do
            if [ $j -eq $e ]
            then
                if [ $(($i%4)) -eq 0 ]&&[ $(($i%100)) -ne 0 ]||[ $(($i%400)) -eq 0 ] #判断是否为闰年
                then
                    for k in {01..29} #闰年
                    do
                        echo $i$j$k >> dict-birthday.txt
                    done
                else
                    for k in {01..28} #平年
                    do
                        echo $i$j$k >> dict-birthday.txt
                    done
                fi
            fi
        done
    done
done

for d in `cat dict-birthday.txt`
do
    echo ${d:0:4}-${d:4:2}-${d:6} >> dict-dirthday-1.txt # eg:1990-06-06
    echo ${d:0:4}/${d:4:2}/${d:6} >> dict-dirthday-2.txt # eg:1990/06/06
    echo ${d:0:4}.${d:4:2}.${d:6} >> dict-dirthday-3.txt # eg:1990.06.06
done

# eg:900606
sed 's/..//' dict-birthday.txt > dict-birthday-4.txt

for d in `cat dict-birthday-4.txt`
do
    echo ${d:0:2}-${d:4:2}-${d:4} >> dict-dirthday-5.txt # eg:90-06-06
    echo ${d:0:2}/${d:4:2}/${d:4} >> dict-dirthday-6.txt # eg:90/06/06
    echo ${d:0:2}.${d:4:2}.${d:4} >> dict-dirthday-7.txt # eg:90.06.06
done

# eg:0606
for j in {01..12}
do
    for o in ${one[@]}
    do
        if [ $j -eq $o ]
        then
            for k in {01..31}
            do
                echo $j$k >> dict-birthday-8.txt
            done
        fi
    done
    for t in ${three[@]}
    do
        if [ $j -eq $t ]
        then
            for k in {01..30}
            do
                echo $j$k >> dict-birthday-8.txt
            done
        fi
    done
    for e in ${two[@]}
    do
        if [ $j -eq $e ]
        then
            for k in {01..29}
            do
                echo $j$k >> dict-birthday-8.txt
            done
        fi
    done
done
echo "字典生成完毕"