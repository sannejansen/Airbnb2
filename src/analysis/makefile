DATA = ..\..\data
TEMP = ..\..\gen\temp
OUTPUT = ..\..\gen\output

all: $(TEMP)\pivot_table.csv $(OUTPUT)\plot_Amsterdam.pdf $(OUTPUT)\plot_all.pdf

$(TEMP)\pivot_table.csv: $(TEMP)\aggregated_df.csv pivot_table.R
	if not exist "..\..\gen\output" mkdir ..\..\gen\output
	R --vanilla < pivot_table.R

$(OUTPUT)\plot_Amsterdam.pdf: $(TEMP)\pivot_table.csv plot_amsterdam.R
	R --vanilla < plot_antwerp.R

$(OUTPUT)\plot_all.pdf: $(TEMP)\aggregated_df.csv plot_all.R
	R --vanilla < plot_all.R