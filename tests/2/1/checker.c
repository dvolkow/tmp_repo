#include <stdio.h>
#include <string.h>
#include "solution.h"

int main(int argc, char* argv[]) {
	char *str1 = "test";
	char *str2 = "";
	int counter = 0;
	int check = 0;

	check = stringStat(str2, 1, &counter);
	if(counter != 1 || check != strlen(str2)) {
		printf("Test 1 failed");
		return 1;
	}

	check = stringStat(str2, 3, &counter);
	if(counter != 2 || check != 3*strlen(str2)) {
		printf("Test 2 failed");
		return 1;
	}

	check = stringStat(str1, 1, &counter);
	if(counter != 3 || check != strlen(str1)) {
		printf("Test 3 failed");
		return 1;
	}

	check = stringStat(str1, 2, &counter);
	if(counter != 4 || check != 2*strlen(str1)) {
		printf("Test 4 failed");
		return 1;
	}

	printf("Success");
	return 0;
}
