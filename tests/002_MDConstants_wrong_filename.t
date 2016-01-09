wrong input filename
====================

setup::

  $ . ${TESTDIR}/setup
  setup loaded
  $ echo ${EXE}
  /home/devin/MPI/MDConstants/tests/main
  $ ARGS=${TESTDIR}/002_wrong_input_dat
 
wrong filename::

  $ ${EXE} ${ARGS} 
  [ERROR] (MDConstants.c:17: errno: No such file or directory) 
  Wrong filename passed: /home/devin/MPI/MDConstants/tests/002_wrong_input_dat/input.dat
  
  
  Program aborted!!!!
  
  [ERROR] (tests/main.c:35: errno: None) Constant init failed
  [255]

