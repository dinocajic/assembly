/* Dino Cajic
   Computer Organization and Programming
   Monday and Wednesday: 3:00pm to 4:15pm
   
   Assignment 3
   Due: Friday October 21st, 2016 at 11:59pm

   The purpose of this program is to test if the flag 0x10 is set in the register %l0.
   - If it's set, then multiply the content of %l0 by 2 using the appropriate shift instruction and exit immediately
   - It it's not, then divide the content of %l0 by 2 using the appropriate shift instruction and exit.
   - Test the program when %l0 is 0x18 and 0x08

*/

.global main

main:
	save %sp, -96, %sp	!Provides space to save registers for GDB

	mov 0x10, %l0           !%l0 = 0x10
        mov 0x18, %l1           !%l1 = 0x18 | This portion can be changed to desired test. i.e. 0x08
       
        btst %l0, %l1           !Is %l0 == 0x10?
        be divide               !If it's clear, go to divide, otherwise go to set
        nop 

multiply:
        sll %l0, 1, %l0         !Shift left the content of %l0 2 spaces for multiplication
	ba end                  !Branch to the end
	nop


divide:
        sra %l0, 1, %l0         !Divide by shifting right
	
end:
	mov 1, %g1		!Exit request
	ta 0			!Trap to system	
