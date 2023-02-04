!/bin/bash

for VARIABLE in 1 2 3 4 5 .. N
do
    g++ -o main_exec main.cpp && ./mainexec >> output_"$VARIABLE".txt
done
