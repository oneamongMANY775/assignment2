#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

// Function to write to file and log the action
int write_to_file(const char *writefile, const char *writestr) {
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Could not create or open file %s", writefile);
        perror("Error");
        return 1; // Exit with error code
    }

    // Write the string to the file
    fprintf(file, "%s", writestr);
    fclose(file);

    // Log the successful write using syslog
    syslog(LOG_DEBUG, "Writing '%s' to %s", writestr, writefile);
    return 0; // Success
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <file-path> <string-to-write>\n", argv[0]);
        return 1; // Error exit
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Open syslog
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Call the function to write to file and log
    int result = write_to_file(writefile, writestr);

    // Close syslog
    closelog();

    return result; // Return success or error code
}
