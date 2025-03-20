#include "unity.h"
#include <stdbool.h>
#include "../../examples/autotest-validate/autotest-validate.h"
#include "../../assignment-autotest/test/assignment1/username-from-conf-file.h"
#include <stdlib.h>

/**
 * This function validates that:
 * 1) `my_username()` (from autotest-validate.c) returns your hardcoded username.
 * 2) `malloc_username_from_conf_file()` (from username-from-conf-file.h) returns 
 *    the same username stored in conf/username.txt.
 * 3) It compares both values using `TEST_ASSERT_EQUAL_STRING_MESSAGE`.
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

