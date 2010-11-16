#!/bin/bash
p4merge -caption="Viewing diff" -nosplash -ro2 -t1="Working copy" -t2="Base" "$2" "$5" | cat
