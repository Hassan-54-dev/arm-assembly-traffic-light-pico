cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(blink_project C CXX ASM)

pico_sdk_init()

add_executable(main
    wrapper.c
)

# Pico ki standard libraries link karna taake 'gpio_init' wagera mil saken
target_link_libraries(main pico_stdlib)

# UF2 file generate karna jo Pico par copy hogi
pico_add_extra_outputs(main)