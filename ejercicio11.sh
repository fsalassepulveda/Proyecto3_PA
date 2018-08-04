#!/bin/bash

cd $HOME
cd 	Escritorio
mkdir Resultados
cd  Resultados 
for i in `seq 0  5`; do
	mkdir año_201$i 
	cd año_201$i
	touch humedad_201$i.txt
	##cat Panguilemodetalle2010-2011.csv |grep '^201$i-' | sed 's/;/ /g'| awk 'BEGIN {print "%HUMEDAD"}{print $6}' >"humedad201X.csv"
	touch temperatura_201$i.txt
	cd ..
done
##cat Panguilemodetalle2010-2011.csv |grep '^2010-' | sed 's/;/ /g'| awk 'BEGIN {print "%HUMEDAD"}{print $6}' >"humedad201X..csv"
##A="carpeta"
#mkdir $A
#cd $A

#for i in `seq 1  40`; do
#	touch $i.txt
	
##done


 
