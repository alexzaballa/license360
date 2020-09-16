#!/bin/sh
 
# license360 collector
 
echo "Start license360."
 
v_param1="$1" # License
v_param2="$2" # FULL our Light
v_param3="$3" # Sections
 
sh ./moat369/sh/run_all_sids.sh "DEF moat369_param1 = '${v_param1}'\nDEF moat369_param2 = '${v_param2}'\nDEF moat369_param3 = '${v_param3}'"
 
echo "End license360 collector."
 
###