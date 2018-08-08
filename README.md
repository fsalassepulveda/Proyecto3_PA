Introduccion al proyecto 
	
El presente programa, realiza una lectura y añalis de datos entregados por una
maquina de medicion metereologica, estos datos seran filtados y organizados, permitiendo la 
posterior generacion de dos graficos, donde el primero mustra la relacion de promedio de temperatura
con cada mes, y el segundo la relacion del promedio de humedad por cada mes correspondiente.

Pre-requisitos del programa

- Antes de poder inicializar la ejecucion del programa, es necesario descargar 
  el paquete r-base. Para instalarlo debe realizar lo siguiente:
	- Abrir terminal
	- si presenta ubuntu o similares:
		-ingresar en la terminal: sudo apt-get install r-base
	- si presenta Devian 
		- ingresar en la terminal:  su (ingresar clave de super usuario)
		- luego: apt-get install r-base

-Luego debe instalar la libreria R = ggplot2 
 para ello  debe ingresar al paquete ya descargado R 
	-Encontrandose dentro de R
		
- ingresar en la terminal: install.packages("ggplot2")  
		- luego: q()
		- le pedira ingresar una opcion, usted debe ingresar: n
		- luego prescione enter 

-Luego es necesario descargar el modulo ryp2, para ello ingrese en la terminal 
 lo siguiente:
	- si presenta ubunto u otros:
		- ingrese: sudo apt-get install python-ryp2
	
	-si presenta debian: 
		- ingrese: su (ingrese su clave de super usuario)
		- luego:   apt-get install python-rpy2	
		
		
Metodo de uso del proyecto:
	- abrir la terminal 
	- ir hacia la ruta donde se encuentra el archivo ejercicio11.sh
	- luego debe escribir en la terminal: bash ejercicio11.sh 
	- En este momento se ejecutara el programa, generando una carpeta en el Escritorio, denominada Resultados
		en la cual existira una carpeta para cada año analizado, dentro de estas carpetas existiran cuatro archivos 
		dos archivos .png los cuales corresponderan a los graficos, ademas se encontraran dos archivos mas de tipo .csv
		los cuales presentan  dos columnas, cada uno, en la primera se encontraran los años que presentan informacion y la segunda 
		el porcentaje de la variable medida (temperatura u humedad)
		
Autores 
- Francisca Salas
- Matias Rojas
	
