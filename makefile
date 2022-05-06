all: analysis data-preparation

data-preparation:
	make -C src\data-preparation

analysis: data_preparation
	make -C src\analysis

clean:
	-rm -r data
	-rm -r gen
