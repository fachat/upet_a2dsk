
PRGS=
ASM=testboot0 headin headout 
APRGS=wdmon a2mon testrwts

all: $(PRGS) $(ASM) $(APRGS)

$(ASM): % : %.a65 a2*.a65 #*.i65
	xa -XCA65 -P$@.lst -l $@.lab -o $@ $<

%.o65: %.a65 *.a65
	xa -XCA65 -c -R -E -bt 1023 -P$@.lst -l $@.lab -o $@ $<

wdmon.o65: dmon.o65 wddrv.o65
	ldo65 -o $@ $^

a2mon.o65: dmon.o65 a2drv.o65
	ldo65 -o $@ $^

${APRGS}: % : %.o65 
	reloc65 -vv -bt 1023 -X -o $@ $<

${PRGS}: % : %.bas
	petcat -w40 -o $@ $<

clean:
	rm -f ${ASM} ${PRGS} 
	rm -f *.lab *.lst
	rm -f *.o65


