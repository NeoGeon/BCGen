SRC= base_io.F90 
include ../Makefile.conf
OBJ_ALL=$(SRC: .F90=.o)

OBJ_ALL:
	$(FC) -c -I$(INCLDIR) -I$(ESMF_MOD) -I$(PIO_INCL) $(SRC)
	cp -f *.o $(LIBDIR)
	cp -f *.mod $(INCLDIR)
