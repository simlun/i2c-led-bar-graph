SQ := .SQUIRREL3/bin/sq

NUTS := $(shell ls -1 *.nut | grep -v specs.nut)
SPECS := $(shell ls -1 *-specs.nut)
SPECOUTPUTSDIR := .specoutputs
SPECOUTPUTS := $(addsuffix .out,$(addprefix $(SPECOUTPUTSDIR)/,$(SPECS)))

.PHONY: debug
debug:
	@echo Squirrel interpreter: $(SQ)
	@echo Squirrel code: $(NUTS)
	@echo SqJasmine specs: $(SPECS)
	@echo SqJasmine outputs: $(SPECOUTPUTS)

$(SQ):
	wget -O .squirrel.tar.gz https://downloads.sourceforge.net/project/squirrel/squirrel3/squirrel%203.0.7%20stable/squirrel_3_0_7_stable.tar.gz
	bash -c "shasum --check <(echo '5ae3f669677ac5f5d663ec070d42ee68980e1911  .squirrel.tar.gz')"
	tar zxf .squirrel.tar.gz
	mv SQUIRREL3 .SQUIRREL3
	(cd .SQUIRREL3; make)


.PHONY: test
test: $(SPECOUTPUTS)

$(SPECOUTPUTSDIR)/%-specs.nut.out: $(SQ) $(NUTS) $(SPECS) | $(SPECOUTPUTSDIR)
	($(SQ) $*-specs.nut | tee $@) && bash -c "grep --quiet 'All tests succeeded' <(tail -n 1 $@)"

$(SPECOUTPUTSDIR):
	mkdir $(SPECOUTPUTSDIR)

.PHONY: clean
clean:
	rm -rf .SQUIRREL3 .squirrel.tar.gz .specoutputs
