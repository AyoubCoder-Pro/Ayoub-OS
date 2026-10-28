/* linker.ld */
ENTRY(start)

SECTIONS {
    . = 1M; /* Load kernel at 1MB address */

    .text : {
        *(.multiboot)
        *(.text)
    }

    .rodata : {
        *(.rodata)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
