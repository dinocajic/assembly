/* Dino Cajic
   Computer Organization and Programming
   Monday and Wednesday: 3:00pm to 4:15pm
   
   Assignment 4
   Due: Friday October 21st, 2016 at 11:59pm

   The purpose of this program is to initialize an array and then to find the largest
   element by searching the array (i.e. through a loop)

   int ary[6] = {2, 5, -3, -4, 0, 6}

   Size = 6 * 4 bytes = -24

*/

.global main

main:
	save %sp, -96 - (6*4) & -8 , %sp	!Provides space to save registers 

                                                !First create the array
        mov 2, %o0                              !Move 2 to register %o0
        st %o0, [%fp - 24]                      !Store 2 in a[0] which is 24 away from fp
        mov %o0, %l0                            !Initialize max value
        
        mov 5, %o0                              !Move 5 to register %o0
        st %o0, [%fp - 24 + 4]                  !Store 5 in a[1] which is 20 away from fp

        mov -3, %o0                             !Move -3 to register %o0
        st %o0, [%fp - 24 + 8]                  !Store -3 in a[2] which is 16 away from fp

        mov -4, %o0                             !Move -4 to register %o0
        st %o0, [%fp - 24 + 12]                 !Store -4 in a[3] which is 12 away from fp

        mov 0, %o0                              !Move 0 to register %o0
        st %o0, [%fp - 24 + 16]                 !Store 0 in a[4] which is 8 away from fp

        mov 6, %o0                              !Move 6 to register %o0
        st %o0, [%fp - 24 + 20]                 !Store 6 in a[5] which is 4 away from fp

        mov -24, %l1                            !Initialize the index value of the first array
	                                                                                                                 
test:                                                                                       
        cmp %l1, -4                             !Cycle through array from -24 to -4
        bge end
        nop

loop:
        add %l1, 4, %l1                         !Increment by 4
        ld [%fp + %l1], %l2                     !Load next element
        
        cmp %l0, %l2                            !Compare %l0 with %l2
        bge test                                !If %l0 is greater, go back to test
        nop

        mov %l2, %l0                            !If %l0 is less than, set %l0 with the current max
        ba test                                 !Always needs to go back to test
        nop


end:
	mov 1, %g1		!Exit request
	ta 0			!Trap to system
