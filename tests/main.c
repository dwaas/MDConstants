#include <assert.h> //assert()
#include <stdio.h>

#include "../MDConstants.h" //MDConstants;
#include "../debug.h"



int
main
(
	int argc, 
	char *argv[]
)
{
        check (
                        argc == 2,
                        "\nNumber of arguments is wrong! \
                        \nusage: ./main working_directory_path!!!!\n\n"
              );

        char work_dir[100];
        sprintf (work_dir, "%s", argv[1]);
        char fname[] = "input.dat";

        //CONSTANTS
        MDConstants K;

        char input_dat[100];
        sprintf (input_dat, "%s/%s", work_dir, fname);
        check 
                (
                 !InitializeMDConsts (&K, input_dat), 
                 "Constant init failed" 
                );

        return 0;

error:
        {
                return -1;
        }
}

