#include "vga.h"

void vga_putchar(char c, uint8_t color, int col, int row) {
    volatile uint16_t *video = (volatile uint16_t *)0xB8000;
    video[row * 80 + col] = color << 8 | c;
}

void vga_print(const char *str, uint8_t color, int col, int row) {
    for (int i = 0; str[i] != '\0'; i++) {
        vga_putchar(str[i], color, col + i, row);
    }
}