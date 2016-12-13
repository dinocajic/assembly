/* Dino Cajic
   Computer Organization and Programming
   Monday and Wednesday: 3:00pm to 4:15pm
   
   Assignment 2
   Due: Thursday September 29th, 2016 at 11:59pm

   The purpose of this program is to execute y = 5x^2 + 6x + 17 where x = 3
   To begin, we'll break this up slightly:
   (5 * (x * x)) + (6 * x) + 17
*/

.global main

main:
	save %sp, -96, %sp	!Provides space to save registers for GDB
	
	mov 3, %l0		!Places the number 3 into register l0
				
				!******************************************************
				!The following code will execute the (x * x)	
	mov %l0, %o0		!Places %l0 into %o0
	mov %l0, %o1		!Places %l0 into %o1
				!The above two statements are necessary because
				!  we're going to call .mul and pass the two parameters
				!  to .mul
	call .mul		!Calls .mul to multiply %o0 and %o1. The result
				!  is stored in %o0
	nop			!******************************************************

				!******************************************************
				!The following code will execute the (5 * result)
	mov 5, %o1		!Places 5 into %o1
	call .mul		!Multiplies %o0 and %o1. The result is stored in %o0
	nop			!******************************************************
	
	mov %o0, %l1		!Moves the result of [5*x^2] into register l1

				!******************************************************
				!The following code will execute the (6 * x)
	mov 6, %o0		!Move 6 into %o0
	mov %l0, %o1		!Move 3 into %o1
	call .mul		!multiply
	nop			!******************************************************

				!******************************************************
				!The addition of the code
	add %l1, %o0, %l1	!The following will add the [5*x^2] to [6*x]
	add %l1, 17, %l2	!The following will add the result above to 17 and 
				!  store it in register l2 where y needs to be
				!******************************************************
	
	mov 1, %g1		!Exit request
	ta 0			!Trap to system	
