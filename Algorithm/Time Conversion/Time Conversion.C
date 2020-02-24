#include <assert.h>
#include <limits.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* readline();

/*
 * Complete the timeConversion function below.
 */

/*
 * Please either make the string static or allocate on the heap. For example,
 * static char str[] = "hello world";
 * return str;
 *
 * OR
 *
 * char* str = "hello world";
 * return str;
 *
 */
char* timeConversion(char* s) {
    /*
     * Write your code here.
     */
    int ten_d = 0,d = 0,ires = 0;
    char a[4];
    ten_d = s[0] - '0';
    d = s[1] - '0';
    if(s[strlen(s) - 2] == 'P'){
        if(ten_d == 1 && d == 2)
        {
        
        }
        else
        {
            ires = ten_d*10 + d + 12;
            if(ires >= 24)
            {
                ires -= 24;
            }
            sprintf(a, "%d", ires);
            s[0] = a[0];
            s[1] = a[1];
        }
    }
    else {
        if(ten_d == 1 && d == 2)
        {
            s[0] = '0';
            s[1] = '0';
        }
    }
    s[strlen(s) - 2] = '\0';

    return s;
}

int main()
{
    FILE* fptr = fopen(getenv("OUTPUT_PATH"), "w");

    char* s = readline();

    char* result = timeConversion(s);

    fprintf(fptr, "%s\n", result);

    fclose(fptr);

    return 0;
}

char* readline() {
    size_t alloc_length = 1024;
    size_t data_length = 0;
    char* data = malloc(alloc_length);

    while (true) {
        char* cursor = data + data_length;
        char* line = fgets(cursor, alloc_length - data_length, stdin);

        if (!line) { break; }

        data_length += strlen(cursor);

        if (data_length < alloc_length - 1 || data[data_length - 1] == '\n') { break; }

        size_t new_length = alloc_length << 1;
        data = realloc(data, new_length);

        if (!data) { break; }

        alloc_length = new_length;
    }

    if (data[data_length - 1] == '\n') {
        data[data_length - 1] = '\0';
    }

    data = realloc(data, data_length);

    return data;
}
