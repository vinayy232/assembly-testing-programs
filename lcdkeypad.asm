EN equ P2.0

RS equ P2.1

RW equ P2.2

mov A,#38H            ; Setting Up the LCD

lcall command

mov A,#0EH            ; Display On

lcall command

mov A,#06H            ; Entry Mode  

lcall command

mov a,#82H

lcall command

lcall disp            ;      Function Disp Called

mov a,#02H            ; Setting DDRAM Address to Home position

lcall command

lcall delay1

 

; Displays BOTSKOOL SHOBHIT ON FIRST LINE OF LCD

mov a,#'V'

lcall datw

NOP

mov a,#'I'

lcall datw

NOP

mov a,#'N'

lcall datw

mov a,#'A'

lcall datw

NOP

mov a,#'Y'

lcall datw

NOP

mov a,#'A'

lcall datw

NOP

mov a,#'K'

lcall datw

NOP

mov a,#'C'

lcall datw

NOP

mov a,#'L'

lcall datw

NOP

mov a,#'A'

lcall datw

NOP

mov a,#'S'

lcall datw

NOP

mov a,#'S'

lcall datw

NOP

mov a,#'E'

lcall datw

NOP

mov a,#'S'

lcall datw

NOP

mov a,#'.'

lcall datw

NOP

mov a,#'.'

lcall datw

MOV A,#255   ; Moving Value 255 to PORT 3

MOV P3,A

; Keypad Scan Begins

sd:

lcall delay1

lcall key1

lcall delay

lcall key2

lcall delay

lcall key3

lcall delay

lcall key4

lcall delay

lcall sd

 

 

 

 

; Function to Send Commands to LCD

command:

clr RW

clr RS

setB EN

MOV P1,A

lcall delay

clr EN

RET

 

; Function to Clear the DDRAM Content

clear:

mov A,#01H

lcall command

lcall delay

mov A,#02H ; Set The DDRAM Address to Home Position

lcall command

lcall delay

RET

; Function to Display Data on LCD Screen

datw:

SETB RS

clr RW

SETB EN

MOV P1,A

lcall delay

clr EN

RET

 

;Function to Display The Key Pressed

datw1:

lcall delay1

lcall disp

lcall delay1

MOV A,R7

lcall datw

RET

 

; Generating Small Delay

delay:

mov r0,#255

loop: DJNZ r0,loop;

RET

 

; Generating a Bigger Delay

delay1:

mov r1,#255

loop1: mov r3,#120

loop2: djnz r3,loop2 

       djnz r1,loop1

RET

 

; Checking for Key Press on The First Column of 4x4 Matrix

 

KEY1:

MOV A,r5

MOV r6,A

clr p3.4

 

MOV A,p3

ANL A,#0FH

MOV r2,A

cjne r2,#14,n1

MOV r7,#'1'

lcall datw1

lcall delay1

 

n1: cjne r2,#13,n2

mov r7,#'5'

lcall datw1

lcall delay1

n2: cjne r2,#11,n3

mov r7,#'9'

lcall datw1

lcall delay1

n3: cjne r2,#7,n4

mov r7,#'D'

lcall datw1

lcall delay1

n4: lcall delay1

SETB P3.4

RET

 

; Checking for Key Press on the Second Column of 4x4 Matrix

KEY2:

clr p3.5

MOV A,p3

ANL A,#0FH

MOV r2,A

 

cjne r2,#14,q1

mov r7,#'2'

lcall datw1

lcall delay1

q1: cjne r2,#13,q2

mov r7,#'6'

lcall datw1

lcall delay1

q2: cjne r2,#11,q3

mov r7,#65; A=65

lcall datw1

lcall delay1

q3: cjne r2,#7,q4

mov r7,#'E'

lcall datw1

lcall delay1

q4: lcall delay

SETB p3.5

RET

 

; Checking for Key Press On The Third Column of 4x4 Matrix

 

KEY3:

clr p3.6

MOV A,p3

ANL A,#0FH

MOV r2,A

 

cjne r2,#14,w1

mov r7,#'3'

lcall datw1

lcall delay1

w1: cjne r2,#13,w2

mov r7,#'7'

lcall datw1

lcall delay1

w2: cjne r2,#11,w3

mov r7,#'B'

lcall datw1

lcall delay1

w3: cjne r2,#7,w4

mov r7,#'F'

lcall datw1

lcall delay1

w4: lcall delay1

SETB p3.6

RET

 

; Checking for Key Press on the Fourth Column of 4x4 Matrix

KEY4:

clr p3.7

MOV A,p3

ANL A,#0FH

MOV r2,A

cjne r2,#14,e1

mov r7,#'4'

lcall datw1

lcall delay1

e1: cjne r2,#13,e2

mov r7,#'8'

lcall datw1

lcall delay1

e2: cjne r2,#11,e3

mov r7,#'C'

lcall datw1

lcall delay1

e3: cjne r2,#7,e4

mov r7,#'G'

lcall datw1

lcall delay1

e4: lcall delay1

SETB p3.7

RET

 

disp:

mov a,#0c0H       ; Setting DDRAM Address on Second Line

lcall command

 

; Clearing the Previous Key Pressed Information from Screen

mov a,#' '

lcall datw

mov a,#' '

lcall datw

mov a,#' '

lcall datw

mov a,#' '

lcall datw

mov a,#' '

lcall datw

mov a,#' '

lcall datw

 

mov a,#0c0H    ; Setting DDRAM Address on Second Line To Display “Key Pressed”

lcall command

 

; Display "KEY" and Pressed Information

mov a,#' '

lcall datw

mov a,#'K'

lcall datw

mov a,#'E'

lcall datw

mov a,#'Y'

lcall datw

mov a,#' '

lcall datw

RET

END