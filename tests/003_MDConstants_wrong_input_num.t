wrong input num
===============

setup::

  $ . ${TESTDIR}/setup
  setup loaded
  $ echo ${EXE}
  /home/devin/MPI/MDConstants/tests/main
 
wrong input num::

  $ ${EXE} ${ARGS} 
  [ERROR] (tests/main.c:20: errno: None) 
  Number of arguments is wrong!                         
  usage: ./main working_directory_path!!!!
  
  
  [255]

