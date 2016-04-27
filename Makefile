
CFLAGS=-Wall -O2

all: gpsdate gps-watchdog

gpsdate: gpsdate.o
	$(CC) $(LDFLAGS) -o $@ $^ -lgps

gps-watchdog: gps-watchdog.o
	$(CC) $(LDFLAGS) -o $@ $^ -lgps

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $^

clean:
	@rm -f gpsdate gps-watchdog *.o

install:
	mkdir -p $(DESTDIR)/usr/sbin
	mkdir -p $(DESTDIR)/lib/systemd/system
	mkdir -p $(DESTDIR)/etc/default
	install gpsdate $(DESTDIR)/usr/sbin
	install --mode 644 gpsdate.service $(DESTDIR)/lib/systemd/system
	install --mode 644 gpsdate-default $(DESTDIR)/etc/default/gpsdate
