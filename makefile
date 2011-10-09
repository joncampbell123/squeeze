all: usq sq

ifndef $(CFLAGS)
CFLAGS=-Os -fomit-frame-pointer
endif

usq.o utr.o: usq.h sqcom.h

sq.o tr2.o tr1.o sqdebug.o sqio.o: sq.h sqcom.h

.c.o:
	gcc $(CFLAGS) -c -o $@ $<

sq:	sq.o tr2.o tr1.o sqdebug.o sqio.o
	gcc $(CFLAGS) -o sq sq.o tr2.o tr1.o sqdebug.o sqio.o

usq:	usq.o utr.o
	gcc $(CFLAGS) -o usq usq.o utr.o

clean:
	rm -f *.o *.a usq sq

install:
	mkdir -p $(DESTDIR)/usr/bin
	cp -v usq sq $(DESTDIR)/usr/bin/

