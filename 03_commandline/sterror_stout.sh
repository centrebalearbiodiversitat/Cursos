#! /bin/bash

#stderr_stdout

#lsx #obtenemos un standard error

read comando

$comando 1>output.txt 2>error.txt

$comando >& logs.txt