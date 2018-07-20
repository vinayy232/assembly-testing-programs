org 0000h
mov tmod,#01h
mov p1,#00h
mov a,#66h
again:mov p1,a
lcall delay
rr a
sjmp again
delay:		mov r2,#20		;			count
again1:		mov th0,#3ch	
			mov tl0,#0b0h
			setb tr0		;on timer
loop:		jnb tf0,loop
			clr tr0			; off timer
			clr tf0
			djnz r2,again1
			ret
			end