
PRGS=
ASM=test1 headin headout

all: $(PRGS) $(ASM)

$(ASM): % : %.a65 a2*.a65 #*.i65
	xa -XCA65 -P$@.lst -l $@.lab -o $@ $<

${PRGS}: % : %.bas
	petcat -w40 -o $@ $<

clean:
	rm -f ${ASM} ${PRGS} 
	rm -f *.lab *.lst

