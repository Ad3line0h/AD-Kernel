#ifndef VGA_H
#define VGA_H

#include <stdint.h>

void vga_putchar(char c, uint8_t color, int col, int row);
void vga_print(const char *str, uint8_t color, int col, int row);

#endif // VGA_H