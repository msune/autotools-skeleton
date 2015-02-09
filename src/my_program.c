#include <stdlib.h>
#include <stdio.h>

//Program specific headers
//#include "config.h"
#include "internal_header.h"

int main(int argc, char** argv){

	//Simply print the number of arguments and configurable options
	fprintf(stderr, "%s launched with number of args: %d\n", argv[0],
									argc);
	fprintf(stderr, "\t'MY_INTERNAL_VAR': %u \n", MY_INTERNAL_VAR);
	//fprintf(stderr, "\t'MY_CONFIGURABLE_VAR': %u \n", MY_CONFIG_VAR);

#ifdef FEATURE_X_ENABLED
	fprintf(stderr, "\tFeature 'X' enabled!\n");
#endif

	return EXIT_SUCCESS;
}
