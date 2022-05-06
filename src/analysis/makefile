DATA = ../../data
TEMP = ../../gen/temp
OUTPUT = = ../../gen/output

all: $(TEMP)/aggregated_df.csv.gz $(OUTPUT)/plot_one.pdf $(OUTPUT)/plot_all.pdf 

$(OUTPUT)/plot_one.pdf: $(TEMP)/aggregated_df.csv.gz plot_one.R
	R --vanilla < plot_one.R

$(OUTPUT)/plot_all.pdf: $(TEMP)/aggregated_df.csv.gz plot_all.R
	R --vanilla < plot_all.R