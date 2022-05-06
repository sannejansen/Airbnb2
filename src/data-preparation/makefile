DATA = ..\..\data
TEMP = ..\..\gen\temp

all: $(DATA)\calendar.csv $(DATA)\listings.csv $(TEMP)\aggregated_df.csv

..\..\data\data\calendar.csv: download.R
	R --vanilla < download.R

..\..\data\listings.csv: download.R
	if not exist "..\..\data" mkdir ..\..\data
	R --vanilla < download.R
	
..\..\gen\temp\aggregated_df.csv: ..\..\data\calendar.csv ..\..\data\listings.csv  clean.R
	if not exist "..\..\gen\temp" mkdir ..\..\gen\temp
	R --vanilla < clean.R
	
