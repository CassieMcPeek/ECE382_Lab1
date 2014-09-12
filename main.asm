;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file

;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory
Program:	.byte		0x22, 0x11, 0x22, 0x22, 0x33, 0x33, 0x08, 0x44, 0x08, 0x22, 0x09, 0x44, 0xff, 0x11, 0xff, 0x44, 0xcc, 0x33, 0x02, 0x33, 0x00, 0x44, 0x33, 0x33, 0x08, 0x55
						;0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0xDD, 0x44, 0x08, 0x22, 0x09, 0x44, 0xFF, 0x22, 0xFD, 0x55
						;0x11, 0x11, 0x11, 0x11, 0x11, 0x44, 0x22, 0x22, 0x22, 0x11, 0xCC, 0x55
					;A Functionality 0x22, 0x11, 0x22, 0x22, 0x33, 0x33, 0x08, 0x44, 0x08, 0x22, 0x09, 0x44, 0xff, 0x11, 0xff, 0x44, 0xcc, 0x33, 0x02, 0x33, 0x00, 0x44, 0x33, 0x33, 0x08, 0x55
						;B Functionality 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0xDD, 0x44, 0x08, 0x22, 0x09, 0x44, 0xFF, 0x22, 0xFD, 0x55
						;0x11, 0x11, 0x11, 0x11, 0x11, 0x44, 0x22, 0x22, 0x22, 0x11, 0xCC, 0x55





			.data

Results:	.space 50

Add:	.equ	0x11
Sub:	.equ	0x22
Mul:	.equ	0x33
Clr:	.equ	0x44
End:	.equ	0x55

			.text

            .retain                         ; Override ELF conditional linking
                                            ; and retain current section
            .retainrefs                     ; Additionally retain any sections
                                            ; that have references to current
                                            ; section
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
                                            ; Main loop here
;-------------------------------------------------------------------------------
			mov.w 	#Program, r5
			mov.b 	@r5, r6
			mov.b 	@r5, r9
			mov.w	#Results, r8

Start		inc r5				; r7 stores operations
			mov.b 	@r5, r7
		    cmp.b	#Add, r7
		    jz	  	Addition
		    cmp.b	#Sub, r7
		    jz	  	Subtract
		    cmp.b	#Mul, r7
		    jz	  	Multi
		    cmp.b	#Clr, r7
		    jz		Clr_Code
		    cmp.b	#End, r7
		    jz	  	End_Code

		    jmp		forever

Addition	inc		r5
			mov.b	@r5, r6
			add.b	r6,	 r9
			jc		store_255
			mov.b	r9, 0(r8)
			inc		r8
			jmp		Start

Subtract	inc		r5
			mov.b	@r5, r6
			sub.b 	r6,  r9
			jlo		store_0

Capacity
			mov.b	r9, 0(r8)
			inc		r8
			jmp		Start

Multi		inc		r5
			mov.b	#1, r11		; start loop at one because initial value is already in r10
			mov.b	@r5, r6
			mov.b	r9, r10
			cmp		#0, r6
			jz		store_0

again		add.b	r9, r10
			jc		store_255
			inc		r11
			cmp		r11, r6
			jz		store
			jmp		again

End_Code	jmp		forever

Clr_Code	mov.b	#0, 0(r8)
			inc		r8
			inc		r5
			mov.b	@r5, r9
			jmp		Start

store		cmp		#255, r10
			jge		store_255
			cmp		#0,  r10
			jn		store_0
			mov.b	r10, 0(r8)
			inc		r8
			jmp		Start

store_0		mov.b	#0, 0(r8)
			mov.b	#0, r6
			inc		r8
			jmp		Start

store_255	mov.b	#255, 0(r8)
			mov.b	#255, r6
			inc		r8
			jmp		Start

forever		jmp		forever

;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect 	.stack

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
