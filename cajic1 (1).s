/* Dino Cajic
   Computer Organization and Programming

   The purpose of this program is to find the maximum value of
   x^3 + 14x^2 + 56x - 64 where x is in the range of -2<=x<=8
*/

.global main

main:
	    save %sp, -96, %sp	    !Provides space to save registers for GDB

        mov -1000,  %l1         !Initializes the max to %l1
        clr %l2                 !Initializes the storage of the result to 0
        mov -3, %l0             !Initializes x and sets it to -3. %l0 will hold the value of x
        ba, test                !Goes to test after -2 is assigned to %l0
        nop
loop:
        mov %l0, %o0            !                                                                  %l0      %l1     %l2     %o0    %o1
        add %o0, 14, %o0        !This is the first portion of the code %o0 =  x^3 + 14             -2       0       0       12     0
        mov %l0, %o1            !This is for %o1 =  x^2                                            -2       0       0       12     -2
        call .mul               !Multiplies the result of x + 14 with x                            -2       0       0       -24    -2
        nop

        add %o0, 56, %o0        !Adds the result of the multiplication to 56                       -2       0       0       32     -2
        mov %l0, %o1            !Moves -2 into %o1 again so that mul can call it properly          -2       0       0       32     -2
        call .mul               !Multiplies the result of the x^3 + 14x^2 + 56 to x                -2       0       0       -64    -2
        nop

        add %o0, -64, %l2       !Subtracts 64 from the result and stores it in %l2                 -2       0       0       -128   -2

        cmp %l1, %l2            !Compares the value of register %l1 with %l2
        ble, max                !If greater than, go to max
        nop
        

test:
        add %l0, 1, %l0         !Add 1 to %l0
        cmp %l0, 8              !Compares x to 8
        ble loop                !If x is less than or equal to 8, branch back to the loop
        nop

	    mov 1, %g1		        !Exit request
	    ta 0			        !Trap to system
max:
        mov %l2, %l1            !Moves the content of %l2 to %l1
        ba test
        nop
