org 0000h
again:	mov a,#38h		;init. LCD 2 lines,5*7 matrix
		acall comnwrt	;call command subroutine
		acall delay		;give lcd time
		mov a,#0eh		;display on,cursor on
		acall comnwrt	;call command subroutine
		acall delay		;give lcd time
		mov a,#01h		;clear lcd
		acall comnwrt	;call command subroutine
		acall delay		;give lcd time
		mov a,#06h		;shift cursor right
		acall comnwrt	;call command subroutine
		acall delay		;give lcd time
		mov a,#84h		;cursor at line one pos.4
		acall comnwrt	;call command subroutine
		acall delay		;give lcd time
		mov a,#'w'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'e'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'l'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'c'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'o'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'m'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'e'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#84h		;cursor at line one pos.4
		acall comnwrt	;call command subroutine
		acall delay		;give lcd time
		mov a,#'v'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'i'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'n'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'a'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'y'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'.'		;display letter 
		acall datawrt	;call display subroutine
		acall delay		;give lcd time
		mov a,#'.'		;display letter 
		acall datawrt	;call display subroutine
		sjmp again
comnwrt:				;send command to lcd
		mov p1,a		;copy reg a to port 1
		clr p2.0		;rs=0 for command
		clr p2.1		;r/w=0 for write
		setb p2.2		;e=1 for high pulse
		acall delay		;give lcd time
		clr p2.2		;e=0 for high to low pulse
		ret				;
datawrt:				;send data to lcd
		mov p1,a		;copy reg a to port 1
		setb p2.0		;rs=1 for data
		clr p2.1		;r/w=0 for write
		setb p2.2		;e=1 for high pulse
		acall delay		;give lcd time
		clr p2.2		;e=0 for high to low pulse
		ret
delay:		mov r2,#20		;			count
agains:		mov th0,#3ch	
			mov tl0,#0b0h
			setb tr0		;on timer
loop:		jnb tf0,loop
			clr tr0			; off timer
			clr tf0
			djnz r2,agains
			ret
		end