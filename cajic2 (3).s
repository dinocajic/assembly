/* Dino Cajic
   Computer Organization and Programming
   Monday and Wednesday: 3:00pm to 4:15pm
   
   Assignment 5
   Due: Friday October 21st, 2016 at 11:59pm

   The purpose of this program is to read and write data from and into the I/O.

   Write an assembly program that prompts the user for two numbers and prints the sum

   Sample Screen Shot:

   Enter Number 1:
   2
   Enter Number 2:
   3
   The sum of 2 and 3 is 5
*/

    .section ".data"

    .align 4

    prompt1: .asciz "\nPlease enter Number 1: "
    prompt2: .asciz "\nPlease enter Number 2: "
   
    format_d: .asciz "%d"
    format1:  .asciz "The sum of %d and %d is: %d\n"

    .align 4

    .section ".bss"
    num1: .skip 4
    num2: .skip 4

    .align 4
    .section ".text"
    .global main

main:
    save %sp, -96, %sp

    !Prompt for the first number
    set prompt1, %o0
    call printf
    nop

    !Read the first number
    set format_d, %o0
    set num1, %o1
    call scanf
    nop

    !Load number 1 to l0
    set num1, %o0
    ld [%o0], %l0

    !Prompt for the second number
    set prompt2, %o0
    call printf
    nop

    !Read the second number
    set format_d, %o0
    set num2, %o1
    call scanf
    nop

    !Load number 2 to l1
    set num2, %o0
    ld [%o0], %l1

    !Perform addition
    add %l0, %l1, %l2
    
    !Print output
    set format1, %o0
    mov %l0, %o1
    mov %l1, %o2
    mov %l2, %o3
    call printf
    nop

    mov 1, %g1
    ta 0                  
