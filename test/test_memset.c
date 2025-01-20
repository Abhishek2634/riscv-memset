#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Use the renamed function
extern void *custom_memset(void *s, int c, size_t n);

void test_memset() {
    char buffer[32];

    printf("Running tests for custom_memset...\n");

    // Test 1: Small buffer
    custom_memset(buffer, 'A', 5);
    buffer[5] = '\0';
    printf("Test 1: %s\n", strcmp(buffer, "AAAAA") == 0 ? "PASS" : "FAIL");

    // Test 2: Large buffer
    custom_memset(buffer, 'B', 32);
    int all_B = 1;
    for (int i = 0; i < 32; i++) {
        if (buffer[i] != 'B') {
            all_B = 0;
            break;
        }
    }
    printf("Test 2: %s\n", all_B ? "PASS" : "FAIL");

    // Test 3: Misaligned buffer
    custom_memset(buffer + 1, 'C', 7);
    printf("Test 3: %s\n", buffer[1] == 'C' && buffer[7] == 'C' ? "PASS" : "FAIL");
}

int main() {
    test_memset();
    return 0;
}
