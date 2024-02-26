#LDFLAGS=-lSystem -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib # hardcoded
LDFLAGS=-lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -arch arm64 # simplified

%.o: %.asm
	as $< -o $@

all: hello shell hello2 hello3 hello4

hello: hello.o
	ld $(LDFLAGS) -o hello.macho hello.o

hello2: hello2.o
	ld $(LDFLAGS) -o hello2.macho hello2.o

hello3: hello3.o
	ld $(LDFLAGS) -o hello3.macho hello3.o

hello4: hello4.o
	ld $(LDFLAGS) -o hello4.macho hello4.o

shell: shell.o
	ld $(LDFLAGS) -o shell.macho shell.o

clean:
	rm *.o *.macho
