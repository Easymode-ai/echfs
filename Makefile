CC=cc
PREFIX=/usr/local
CFLAGS=-O3 -Wall -Wextra -pipe

.PHONY: all clean install

all: echfs-utils echfs-fuse

echfs-utils:
	$(CC) $(CFLAGS) echfs-utils.c -o echfs-utils

echfs-fuse:
	$(CC) $(CFLAGS) echfs-fuse.c $(shell pkg-config fuse --cflags --libs) -o echfs-fuse

clean:
	rm -f echfs-utils
	rm -f echfs-fuse

install:
	mkdir -p $(PREFIX)/bin
	cp echfs-utils $(PREFIX)/bin
	cp echfs-fuse $(PREFIX)/bin
