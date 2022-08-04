#!/bin/bash

cat ./DataFiles/opra_example_regression.log | 
    grep -B 2 -A 48 'Type: Trade' | 
        while read line; do grep 'Record Publish\|wTradePrice\|wTradeVolume'>>output_for_q2; 
            done