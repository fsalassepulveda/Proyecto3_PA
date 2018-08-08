#!/bin/bash
cd $HOME
cd Escritorio
mkdir Resultados
cd Resultados 

echo -e "#!/bin/bash \n
wget -r -A .csv -nd  https://srvbioinf1.utalca.cl/~fduran/data
wget -r -A .zip -nd https://srvbioinf1.utalca.cl/~fduran/scripts.zip
unzip scripts.zip
rm -r scripts.zip
chmod 777 scripts
cd scripts
cp -a generateGraphic.py /scripts $HOME/Escritorio/Resultados
" > Lista.txt



bash Lista.txt

for i in `seq 0  5`; do
	mkdir anio_201$i 
	#cd año_201$i
	touch humedad_201$i.txt
	touch temperatura_201$i.txt
	touch humedad1_201$i.csv
	touch temperatura1_201$i.csv
	
	#mv humedad_201$i.txt año_201$i
	 
done	

cat Panguilemodetalle2010-2011.csv   |grep 2010 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2  " " $8}'> humedad_2010.txt
cat Panguilemodetalle2010-2011.csv Panguilemodetalle2011-2012.csv  |grep 2011 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2  " " $8}'>humedad_2011.txt
cat Panguilemodetalle2011-2012.csv Panguilemodetalle2012-2013.csv  |grep 2012 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print  $2  " " $8}'>humedad_2012.txt
cat Panguilemodetalle2012-2013.csv Panguilemodetalle2013-2014.csv  |grep 2013 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2 " " $8}' >humedad_2013.txt
cat Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2014 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2 " " $8}'>humedad_2014.txt
cat Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2015 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2 " " $8}'>humedad_2015.txt

cat Panguilemodetalle2010-2011.csv   |grep 2010 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2 " " $9}'>temperatura_2010.txt
cat Panguilemodetalle2010-2011.csv Panguilemodetalle2011-2012.csv  |grep 2011 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2  " " $9}'>temperatura_2011.txt
cat Panguilemodetalle2011-2012.csv Panguilemodetalle2012-2013.csv  |grep 2012 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print  $2  " " $9}'>temperatura_2012.txt
cat Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2014 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2 " " $9}'>temperatura_2014.txt
cat Panguilemodetalle2012-2013.csv Panguilemodetalle2013-2014.csv  |grep 2013 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2  " " $9}'>temperatura_2013.txt
cat Panguilemodetalle2013-2014.csv Panguilemodetalle2014-2015a.csv Panguilemodetalle2014-2015b.csv  |grep 2015 | sed 's/;/ /g' | sed 's/-/ /g' |awk '{print $2 " " $9}'>temperatura_2015.txt

for i in `seq 1 12`;do
	cat humedad_2010.txt |awk '$1=='$i' {prom+=$2; sum+=1};END {print '$i' ";" prom/sum}'|sed 's/-nan/0/g' >> humedad1_2010.csv
	cat humedad_2011.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i' ";" prom/sum}'  |sed 's/-nan/0/g'>> humedad1_2011.csv
	cat humedad_2012.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}' |sed 's/-nan/0/g' >> humedad1_2012.csv
	cat humedad_2013.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}' |sed 's/-nan/0/g'>> humedad1_2013.csv
	cat humedad_2014.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}'|sed 's/-nan/0/g' >> humedad1_2014.csv
	cat humedad_2015.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}'|sed 's/-nan/0/g' >> humedad1_2015.csv

	cat temperatura_2010.txt |awk '$1 =='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}'|sed 's/-nan/0/g' >> temperatura1_2010.csv
	cat temperatura_2011.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}' |sed 's/-nan/0/g'>> temperatura1_2011.csv
	cat temperatura_2012.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}' |sed 's/-nan/0/g'>> temperatura1_2012.csv
	cat temperatura_2013.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}'|sed 's/-nan/0/g' >> temperatura1_2013.csv
	cat temperatura_2014.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'  ";" prom/sum}'|sed 's/-nan/0/g' >> temperatura1_2014.csv
	cat temperatura_2015.txt |awk '$1=='$i' {prom+=$2; sum+=1} ;END {print '$i'";" prom/sum}' |sed 's/-nan/0/g' >> temperatura1_2015.csv

done

for i in `seq 0  5`; do
	rm  humedad_201$i.txt
	rm temperatura_201$i.txt
	mv humedad1_201$i.csv anio_201$i
	mv temperatura1_201$i.csv anio_201$i
	python generateGraphic.py anio_201$i 'Humedad' ./anio_201$i/humedad1_201$i.csv 'Meses' 'Humedad' '%Humedad'
	python generateGraphic.py anio_201$i 'Temperatura' ./anio_201$i/temperatura1_201$i.csv 'Meses' 'Temperatura' '%Temperatura'

done
	

 
