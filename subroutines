/* Dino Cajic
   Computer Organization and Programming

   Translate the following three subroutines into assembly language:

   main() {
       fn(1,3,2,4,8,6,5);
   }

   fn(int a, b, c, d, e, f, g) {
       register int, x, y, z;
       x = a + b * c;
       y = d - e / f;
       z = power(x, g);
       return x + y + z;
   }

   power(int base, int exponent) {
       register int p, e;
       p = 1;

       for(int e = 1; e <= exponent; e++) {
           p *= base;
       }
   }

*/

.global main

main:
        save %sp, -92 & -8, %sp   !Save the necessary space and align by 8

        add %sp, -1 * 4 * -8, %sp !Add additional space to subroutine for the extra parameter

        mov 5, %o0                !Place last parameter in register %o0
        st %o0, [%sp + 92]        !Store the last parameter into memory

        mov 6, %o5                !Move parameter 6 into %o5
        mov 8, %o4                !Move parameter 5 into %o4
        mov 4, %o3                !Move parameter 4 into %o3
        mov 2, %o2                !Move parameter 3 into %o2
        mov 3, %o1                !Move parameter 2 into %o1
        mov 1, %o0                !Move parameter 1 into %o0

        call fn                   !Call subroutine fn and pass arguments to it
        nop

        sub %sp, -1 * 4 & -8, %sp !Subtract the added space for parameter
        
        mov 1, %g1
        ta 0

.global fn

fn:
        save %sp, -92 & -8, %sp   !Save the necessary space for the subroutine
      
        mov %i1, %o0              !x = a + b * c
        mov %i2, %o1              
        call .mul
        nop

        add %i0, %o0, %l0
        
        mov %i4, %o0              !y = d - e / f
        mov %i5, %o1
        call .div
        nop

        sub %i3, %o0, %l1         

        mov %l0, %o0              !%o0 = %l0
      
        ld [%fp + 92], %o1

        call power                !Call the power subrouine and pass %o0 and %o1
        nop

        mov %o0, %l2              !return x + y + z;
        add %l0, %l1, %o0
        add %o0, %l2, %o0
        mov %o0, %i0              !When returning, it has to be in %i since the %i
                                  !will be an %o in the calling function
        
        ret
        restore

.global power

power:
        save %sp, -92 & -8, %sp  !Save the necessary space for the subroutine

        mov 1, %l0               !Initialization for the loop
        mov 1, %o1

loop:
        mov %l0, %o0             !p *= base
        mov %i0, %o1
        call .mul
        nop

        mov %o0, %l0             !Store output into %l0
        add %l1, 1, %l1          !Add 1 to e

test:
        cmp %l1, %i1             !Check to see if e <= exponent
        ble loop                 !If <=, then branch to loop
        nop

        mov %o0, %i0             !Move the result to %i0 to return

        ret
        restore
