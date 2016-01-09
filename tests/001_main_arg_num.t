main.c: parameter number guard
==============================

setup::

  $ . ${TESTDIR}/setup
  setup loaded
  $ echo ${EXE}
  /home/devin/MPI/MDConstants/tests/main
 
no args::

  $ ${EXE}
  [ERROR] (tests/main.c:20: errno: None) 
  Number of arguments is wrong!                         
  usage: ./main working_directory_path!!!!
  
  
  [255]

too many args::

  $ ${EXE} 29038 232
  [ERROR] (tests/main.c:20: errno: None) 
  Number of arguments is wrong!                         
  usage: ./main working_directory_path!!!!
  
  
  [255]
  $ ${EXE} ajlfd 233 2  slfkj9 23 25
  [ERROR] (tests/main.c:20: errno: None) 
  Number of arguments is wrong!                         
  usage: ./main working_directory_path!!!!
  
  
  [255]

