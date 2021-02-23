#!/bin/sh
# var1=$(python3 /home/utkarsh/Project_work/mako-templates/readcsv.py)
# var2=$(python3 /home/utkarsh/Project_work/mako-templates/readcsv.py)
# echo $var2
# read  var1 var2 <<<$(python3 /home/utkarsh/Project_work/mako-templates/readcsv.py);
# var3=$(python3 /home/utkarsh/Project_work/mako-templates/readcsv.py)
# echo $var1
# echo var1
# echo var2
python3 -c "from mako.template import Template; import sys;sys.stdout.write(Template(filename='parameterize_inst.v.mako'
).render(bus_sig='hello'))" > slave_template1.v
