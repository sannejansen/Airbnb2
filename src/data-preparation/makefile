DATA = ../../data
TEMP = ../../gen/temp

all: $(DATA)/calendar.csv $(DATA)/listings.csv $(TEMP)/aggregated_df.csv.gz

../../data/listings.csv: download.R
	R --vanilla < download.R

../../data/calendar.csv: download.R
	mkdir -p ../../data
	R --vanilla < download.R

../../gen/temp/aggregated_df.csv.gz: ../../data/calendar.csv ../../data/listings.csv  clean.R
	mkdir -p ../../gen/temp
	R --vanilla < clean.R