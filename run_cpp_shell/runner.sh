!/bin/bash

for VARIABLE in 1 2 3 4 5 10
do
    g++ -o main_exec main.cpp && ./main_exec $VARIABLE >> output_"$VARIABLE".txt
done
