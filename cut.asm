.386
.MODEL FLAT, C


EXTERN	lstrlenA@4:			PROC

.DATA
	begin	DD ? ; индекс на начало подстроки в строке
	lenght	DD ? ; длина подстроки
	orig	DD ? ; адрес исходной строки
	cutted	DD ? ; адрес подстроки
	
.CODE
_cut PROC
PUSH EBP
MOV EBP, ESP
MOV EAX,[EBP]+4
MOV orig,EAX
MOV EAX,[EBP]+8
MOV cutted,EAX
MOV EAX,[EBP]+12
SUB EAX,1
MOV begin,EAX
MOV EAX,[EBP]+16
MOV lenght,EAX



exit:
pop ebp
ret
strcopy endp
end 
