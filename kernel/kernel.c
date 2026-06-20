#include "vga.h"

void kernel_main() {
    vga_print("Hello, AD-Kernel!", 0x0F, 0, 0);
    while (1) {}    // 여기서 멈춤
}

