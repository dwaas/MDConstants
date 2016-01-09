CC=gcc
FLAGS= -Wvector-operation-performance -Wshadow -Wsuggest-attribute=const -Wall -Wextra -march=native -ftree-loop-im -fopenmp -std=gnu99 #-fprofile-arcs -ftest-coverage #-funroll-loops 
ENDFLAGS= -lm -lgomp 
OBJS= $(TESTDIR)/main.o MDConstants.o 
DEPS= MDConstants.h debug.h

EXE=tests/main
TESTDIR=tests
ARGS= ../../testrun

#make check flags
RAMDISK=~/ramdisk
RAMDIR=$(RAMDISK)/MDConstants

ifeq ($(debug), 1) #test code
RUNFLAGS= -O0 -g -Werror $(FLAGS)
else #production code
RUNFLAGS= -O3 -DNDEBUG $(FLAGS)
endif
debug=0

.PHONY: all
all: $(EXE)

#debug and profiling
.PHONY: check
check: ramdir
	cd $(RAMDIR) && cram -vi $(TESTDIR); rm -rf $(RAMDIR); cd -  

.PHONY: ramdir
ramdir: clean $(EXE)
	mkdir -p $(RAMDIR) && cp -r * $(RAMDIR) && ls $(RAMDIR)

.PHONY: debug
debug: clean $(EXE)
	gdb --args ./$(EXE) $(ARGS) 

.PHONY: mem_check
mem_check: clean $(EXE)
	valgrind -v --leak-check=full --show-leak-kinds=all ./$(EXE) $(ARGS)

.PHONY: prof
prof: clean_prof $(EXE)
	valgrind --tool=callgrind ./$(EXE) $(ARGS)

.PHONY: time
time: clean $(EXE)
	time ./$(EXE) $(ARGS)	

#CLEAN
.PHONY: clean
clean: clean_prof clean_tests
	rm -f *.o $(EXE) 

.PHONY: clean_tests
clean_tests:
	rm -f $(TESTDIR)/*.err

.PHONY: clean_prof
clean_prof:
	rm -f gmon.out prof *.gcov *gcno
#COMPILE
$(EXE): $(OBJS)
	$(CC) -o $@ $^ $(RUNFLAGS) $(ENDFLAGS)

%.o:  %.c $(DEPS) 
	$(CC) -c -o $@ $< $(RUNFLAGS)



