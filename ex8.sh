#!/bin/bash
let a1=5+4           # if we don't put quotes around the expression then it must be written with no spaces
echo a1 = $a1        # a1 = 9
let "a2 = 5 + 4"     # used quotes which allow us to space out the expression to make it more readable
echo a2 = $a2        # a2 = 9
let a2++
echo a3 = $a2        # a3 = 10
let "a4 = 4 * 5"
echo a4 = $a4        # a4 = 20
let "a5 = $1 + 30"   # We may also include other variables in the expression.
echo a5 = $a5        # a5 = 42

expr 5 + 4           # 9
expr "5 + 4"         # 5 + 4
expr 5+4             # 5+4
expr 5 \* $1         # 60
expr 11 % 2          # 1
b=$( expr 10 - 3 )
echo b = $b          # b = 7

c1=$(( 4 + 5 ))
echo c1 = $c1        # c1 = 9
c2=$((3+5))
echo c2 = $c2        # c2 = 8
c3=$(( c2 + 3 ))
echo c3 = $c3        # c3 = 11
c4=$(( $c2 + 4 ))
echo c4 = $c4        # c4 = 12
(( c4++ ))
echo c5 = $c4        # c5 = 13
(( c4 += 3 ))
echo c6 = $c4        # c6 = 16
c7=$(( 4 * 5 ))
echo c7 = $c7        # c7 = 20
