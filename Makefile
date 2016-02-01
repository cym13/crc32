
crc32: crc32.d
	ldmd -release -O -inline crc32

clean:
	rm crc32 *.o
