#!/bin/bash
var1='Hello World'
echo var1 : $var1
var2='Hi, $var1'
echo var2 : $var2
var3="Hi, $var1"
echo var3 : $var3

var4=$( ls . | wc -l )
echo var4 : There are $var4 entries in current directory
var5=$( ls )
echo var5 : $var5
