// Pico LED Blink Program in C
#include "pico/stdlib.h"
#include "hardware/gpio.h"

#define LED_PIN 25

int main(void) {
    stdio_init_all();  // Initialize standard I/O
    
    gpio_init(LED_PIN);             // Initialize GPIO pin 25
    gpio_set_dir(LED_PIN, GPIO_OUT); // Set pin 25 as output
    
    while (true) {
        gpio_put(LED_PIN, 1);       // LED ON
        sleep_ms(500);              // Wait 500ms
        
        gpio_put(LED_PIN, 0);       // LED OFF
        sleep_ms(500);              // Wait 500ms
    }
    
    return 0;
}
