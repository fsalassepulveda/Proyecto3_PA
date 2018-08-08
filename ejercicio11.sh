#!/bin/bash
cd $HOME
cd 	Escritorio
#mkdir Resultados
cd  Resultados 

for i in `seq 0  5`; do
	mkdir anio_201$i 
	#cd año_201$i
	touch humedad_201$i.txt
	touch temperatura_201$i.txt
	touch humedad1_201$i.csv
	touch temperatura1_201$i.csv
	
	#mv humedad_201$i.txt año_201$i
	 
done	

cat Panguilemodetalle2010-2011.csv   |grep 2010 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $8  " " $2}'>humedad_2010.txt
cat Panguilemodetalle2010-2011.csv Panguilemodetalle2011-2012.csv  |grep 2011 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $8  " " $2}'>humedad_2011.txt
cat Panguilemodetalle2011-2012.csv Panguilemodetalle2012-2013.csv  |grep 2012 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print  $8  " " $2}'>humedad_2012.txt
cat Panguilemodetalle2012-2013.csv Panguilemodetalle2013-2014.csv  |grep 2013 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $8  " " $2}'>humedad_2013.txt
cat Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2014 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $8 " " $2}'>humedad_2014.txt
cat Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2015 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $8 " " $2}'>humedad_2015.txt

cat Panguilemodetalle2010-2011.csv   |grep 2010 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $9  " " $2}'>temperatura_2010.txt
cat Panguilemodetalle2010-2011.csv Panguilemodetalle2011-2012.csv  |grep 2011 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $9  " " $2}'>temperatura_2011.txt
cat Panguilemodetalle2011-2012.csv Panguilemodetalle2012-2013.csv  |grep 2012 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print  $9  " " $2}'>temperatura_2012.txt
cat Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2014 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $9 " " $2}'>temperatura_2014.txt
cat Panguilemodetalle2012-2013.csv Panguilemodetalle2013-2014.csv  |grep 2013 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $9  " " $2}'>temperatura_2013.txt
cat Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2015 | sed 's/;/ /g' | sed 's/-/ /g' |awk 'BEGIN {print "%HUMEDAD"}{print $9 " " $2}'>temperatura_2015.txt

for i in `seq 0 12`;do
	cat humedad_2010.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' |awk '$2=! $i  ;END {print "0"  " ; " "0"}'|sed 's/-nan/0/g' >> humedad1_2010.csv
	cat humedad_2011.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}'  >> humedad1_2011.csv
	cat humedad_2012.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> humedad1_2012.csv
	cat humedad_2013.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> humedad1_2013.csv
	cat humedad_2014.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> humedad1_2014.csv
	cat humedad_2015.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> humedad1_2015.csv

	cat temperatura_2010.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' |sed 's/-nan/0/g' >> temperatura1_2010.csv
	cat temperatura_2011.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> temperatura1_2011.csv
	cat temperatura_2012.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> temperatura1_2012.csv
	cat temperatura_2013.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> temperatura1_2013.csv
	cat temperatura_2014.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> temperatura1_2014.csv
	cat temperatura_2015.txt |awk '$2=='$i' {prom+=$1; sum+=1; mes=$2} ;END {print mes  " ; " prom/sum}' >> temperatura1_2015.csv

done

for i in `seq 0  5`; do
	rm  humedad_201$i.txt
	rm temperatura_201$i.txt
	mv humedad1_201$i.csv anio_201$i
	mv temperatura1_201$i.csv anio_201$i
#	python generateGraphic.py anio_201$i 'img' ./anio_201$i/humedad1_201$i.csv 'meses' 'humedad' 'BK'
#	python generateGraphic.py anio_201$i 'img1' ./anio_201$i/temperatura1_201$i.csv 'meses' 'humedad' 'BK'

done
	python generateGraphic.py anio_2010 'img' ./anio_2010/humedad1_2010.csv 'meses' 'humedad' 'BK'
	python generateGraphic.py anio_2010 'img1' ./anio_2010/temperatura1_2010.csv 'meses' 'humedad' 'BK'

 
