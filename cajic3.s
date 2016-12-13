/* Dino Cajic
   Computer Organization and Programming
   Monday and Wednesday: 3:00pm to 4:15pm
   
   Assignment 2
   Due: Thursday September 29th, 2016 at 11:59pm

   The purpose of this program is to execute y = 5x^2 + 6x + 17 where x = 1...8
   To begin, we'll break this up slightly:
   (5 * (x * x)) + (6 * x) + 17

   This Portion deals with the third portio. It will create a loop
*/

.global main

main:
	save %sp, -96, %sp	!Provides space to save registers for GDB
	mov 8, %l0		!Initializes 8 to %l0	
	mov 1, %l1		!Initializes 1 to %l1

.global test

test:
	cmp %l1, %l0		!Compares l1 to 8
	bg done			!If greater than  8, go to done
	nop

	mov %l1, %o0		!move 1 to %o0
	call .mul		!multiply
	mov %l1, %o1		!move 1 to %o1

				!We just finished x * x

	call .mul		!multiply 5 * x^2
	mov 5, %o1		!move 5 to %01
	
				!we currently have the first part done. need to free %o0

	mov %o0, %l2		!(5*x^2) = %l2

	mov %l1, %o0		!move %l1 to %o0
	call .mul		!multiply
	mov 6, %o1		!move 6 to %01

				!We have the 6 * x done and stored in %o0

	add %l2, %o0, %l2	!Add the first two parts of the equation
	add %l2, 17, %l2	!Add the next portion of the equation to the result
	add %l1, 1, %l1		!Add 1 to %l1
	ba,a test		!Go back to the test

done:
	mov 1, %g1		!Exit request
	ta 0			!Trap to system	
