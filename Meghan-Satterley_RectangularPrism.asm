;Meghan Satterley
;Spring 2022
;This program prompts the user for the height, length, and width of a prism
;then displays the volume and surface area
;Implements simple procedure calls and performs calculations

TITLE Rectangular Prism	(Meghan-Satterley_RectangularPrism.asm)

INCLUDE Irvine32.inc

.data

;declare necessary 32 bit variables

lengthX		DWORD	?
widthX		DWORD	?
heightX		DWORD	?
volume 		DWORD	?
surfaceArea		DWORD	?

;declare necessary prompt and display lines

description	BYTE	0Dh,0Ah,"Dimensions of Rectangular Prism",0
lengthPrompt	BYTE	0Dh,0Ah,"  Prism base length:  ",0
widthPrompt	BYTE	0Dh,0Ah,"  Prism base  width:  ",0
heightPrompt	BYTE	0Dh,0Ah,"  Prism full height:  ",0
volumeDisplay	BYTE	0Dh,0Ah," Cubic prism volume:  ",0
areaDisplay	BYTE	0Dh,0Ah,"Square surface area:  ",0

.code
main PROC

	call	inputPrompt		; prompts user for length, width, height
	call	calculateVolume		
	call	calculateArea		
	call	displayResults	; displays Volume and Surface Area

	call  Crlf
	call	WaitMsg
	exit
main ENDP

inputPrompt PROC
	
	mov  edx,OFFSET description ;display description
	call WriteString
	call Crlf

LengthCode:
	
	mov  edx,OFFSET lengthPrompt ;prompt user for length
	call WriteString
	call ReadInt
	cmp  eax,0
	jle  LengthCode
	mov  lengthX,eax
	
WidthCode:

	mov  edx,OFFSET widthPrompt ;prompt user for width
	call WriteString
	call ReadInt
	cmp  eax,0
	jle  WidthCode
	mov  widthX,eax

HeightCode:
	
	mov  edx,OFFSET heightPrompt ;prompt user for height
	call WriteString
	call ReadInt
	cmp  eax,0
	jle  HeightCode
	mov  heightX,eax

	ret				; return to calling routine
inputPrompt ENDP

calculateVolume PROC		;calculate the volume

	mov  eax,0			
	mov  eax,lengthx		
	mul  widthx
	mul  heightx
	mov  volume,eax

	ret				;return to calling routine
calculateVolume ENDP

calculateArea PROC		;calculate the surface area

	mov  ebx,2			

	mov  eax,0
	mov  eax,lengthx
	mul  widthx
	mul  ebx
	mov  surfaceArea,eax

	mov  eax,0
	mov  eax,widthx
	mul  heightx
	mul  ebx
	add  surfaceArea,eax

	mov  eax,0		
	mov  eax,lengthx
	mul  heightx
	mul  ebx
	add  surfaceArea,eax

	ret				; return to calling routine
calculateArea ENDP

displayResults PROC

	mov  edx,OFFSET volumeDisplay  ;display volume
	call WriteString
	mov  eax,volume
	call WriteDec
	call Crlf

	mov  edx,OFFSET areaDisplay 	;display area
	call WriteString
	mov  eax,surfaceArea
	call WriteDec
	call Crlf

	ret				; return to calling routine
displayResults ENDP

END main