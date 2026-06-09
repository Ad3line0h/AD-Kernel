void kernel_main() {
    char* video_memory = (char*) 0xB8000;
    video_memory[0] = 'K';
    video_memory[1] = 0x0F;
    while (1) {}    // 여기서 멈춤
}
