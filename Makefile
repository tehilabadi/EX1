CC=gcc
AR=ar
OBJECT_MAIN=main.o
OBJECTS_LIB=basicMath.o power.o
FLAGS= -Wall -g

all:maind mains
	
mains: mymaths main.o
	$(CC) $(FLAGS) -o mains $(OBJECT_MAIN) libmyMath.a 

# Creates library for the file objects
maind: mymathd main.o
	$(CC) $(FLAGS) -o maind $(OBJECT_MAIN) ./libmyMath.so

# links main and the static library
mymathd: $(OBJECTS_LIB)
	$(CC) -shared -o libmyMath.so $(OBJECTS_LIB)

#links main and the shared library
mymaths: $(OBJECTS_LIB)
	$(AR) -rcs libmyMath.a $(OBJECTS_LIB)	

# Links power and .h
power.o: power.c myMath.h
	$(CC) $(FLAGS) -fPIC -c power.c

# Links basicMath and .h
basicMath.o: basicMath.c myMath.h
	$(CC) $(FLAGS) -c basicMath.c

# Links Main and .h
main.o: main.c myMath.h  
	$(CC) $(FLAGS) -c main.c 

# Removes all .o .a and .so files. also mains and maind
clean:
	rm -f *.o *.a *.so mains maind
