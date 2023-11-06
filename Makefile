all:
	stack build

Day%:
	stack run $@ < input/day$*.input

%:
	stack build
