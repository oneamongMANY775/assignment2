
#include "unity.h"
#include <stdbool.h>
#include "../../examples/autotest-validate/autotest-validate.h"
#include "../../assignment-autotest/test/assignment1/username-from-conf-file.h"
#include <stdlib.h>
/**
 * This function should:
 *   1) Call the `my_username()` function in `autotest-validate.c` to get your hardcoded username.
 *   2) Obtain the value returned from `malloc_username_from_conf_file()` (from `username-from-conf-file.h`)
 *      which retrieves the username from the `conf/username.txt` file.
 *   3) Use unity assertion `TEST_ASSERT_EQUAL_STRING_MESSAGE` to verify that both strings match.
 */

void test_validate_my_username()
{
    // Get the hardcoded username
    const char *hardcoded_username = my_username();

    // Get the username from the config file
    char *config_username = malloc_username_from_conf_file();

    // Check if both usernames match
    TEST_ASSERT_EQUAL_STRING_MESSAGE(hardcoded_username, config_username, 
        "Username from my_username() does not match the one in conf/username.txt");

    // Free allocated memory
    free(config_username);
}

