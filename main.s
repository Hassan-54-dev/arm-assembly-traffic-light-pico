@ Pico Assembly LED Blink
.thumb_func          @ Compiler ko batana ke ye Thumb instructions hain
.global main         @ Main function ko export karna
.align 4             @ Memory alignment

@ External SDK functions declare karna
.extern stdio_init_all
.extern gpio_init
.extern gpio_set_dir
.extern gpio_put
.extern sleep_ms

.global main_asm
main_asm:
    bl stdio_init_all    @ SDK function: Saare standard I/O initialize karein
    
    movs r0, #25         @ Pico ki onboard LED Pin 25 par hoti hai
    bl gpio_init         @ SDK function: Pin 25 ko initialize karein
    
    movs r0, #25
    movs r1, #1          @ 1 ka matlab hai 'Output' mode
    bl gpio_set_dir      @ SDK function: Pin ko output set karein

loop:
    @ LED ko ON karna
    movs r0, #25
    movs r1, #1          @ 1 = HIGH
    bl gpio_put          @ SDK function: LED ON ho gayi
    
    ldr r0, =500000      @ 500ms ka delay (approx)
    bl sleep_ms          @ SDK function: Intezaar karein
    
    @ LED ko OFF karna
    movs r0, #25
    movs r1, #0          @ 0 = LOW
    bl gpio_put          @ SDK function: LED OFF ho gayi
    
    ldr r0, =500000
    bl sleep_ms          @ SDK function: Intezaar karein
    
    b loop               @ Wapas loop ke shuru mein jayen (Infinite loop)
