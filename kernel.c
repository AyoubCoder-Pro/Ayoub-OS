/* kernel.c - Simple kernel that writes to VGA text buffer */
void kmain(void) {
    char *video_memory = (char*) 0xB8000;
    const char *str = "Welcome to your Custom Operating System! System is running successfully.";
    
    // Clear screen first (80x25 text mode)
    for (int i = 0; i < 80 * 25; i++) {
        video_memory[i * 2] = ' ';
        video_memory[i * 2 + 1] = 0x07; // Light grey on black
    }
    
    // Write the message centered horizontally on row 10
    int start_pos = (10 * 80 + 2) * 2; 
    int i = 0;
    while (str[i] != '\0') {
        video_memory[start_pos + (i * 2)] = str[i];
        video_memory[start_pos + (i * 2) + 1] = 0x0A; // Bright green on black
        i++;
    }
    
    while(1) {
        // Infinite loop to keep CPU busy
    }
}
