DATA = ..\..\data
TEMP = ..\..\gen\temp

all: $(DATA)\calendar.csv $(DATA)\listings.csv $(TEMP)\Average_Daily_Prices_Per_Neighbourhood.csv.gz

..\..\data\data\calendar.csv: download.R
	R --vanilla < download.R

..\..\data\listings.csv: download.R
	if not exist "..\..\data" mkdir ..\..\data
	R --vanilla < download.R
	
..\..\gen\temp\Average_Daily_Prices_Per_Neighbourhood.csv.gz: ..\..\data\calendar.csv ..\..\data\listings.csv  clean.R
	if not exist "..\..\gen\temp" mkdir ..\..\gen\temp
	R --vanilla < clean.R
	
