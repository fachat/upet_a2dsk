
PRGS=
ASM=test1

all: $(PRGS) $(ASM)

updemo.hex: updemo
	hexdump -C $< > $@.hex

$(ASM): % : %.a65 #*.i65
	xa -XCA65 -P$@.lst -l $@.lab -o $@ $<

${PRGS}: % : %.bas
	petcat -w40 -o $@ $<

clean:
	rm -f updemo.lab updemo.hex

