.386
.MODEL FLAT, C


EXTERN	lstrlenA@4:			PROC

.DATA
	begin	DD ? ; индекс на начало подстроки в строке
	lenght	DD ? ; длина подстроки
	orig	DD ? ; адрес исходной строки
	cutted	DD ? ; адрес подстроки
	
.CODE
cut PROC
; Запишем переменные
PUSH EBP
MOV EBP, ESP
MOV EAX,[EBP]+8; +8 потому что в предыдущих 8 битах хранится указатели на возвращаемые переменные
MOV orig,EAX
MOV EAX,[EBP]+12
MOV cutted,EAX
MOV EAX,[EBP]+16
SUB EAX,1
MOV begin,EAX
MOV EAX,[EBP]+20
MOV lenght,EAX

;проверка выхода за пределы массива
MOV EBX, begin
ADD EBX, lenght
PUSH orig
CALL lstrlenA@4
.if EBX > EAX
	MOV EAX, 0
	JMP exit
.endif
MOV EBX, 2147483647
MOV EAX, lenght
.if EAX > EBX
	MOV EAX, 0
	JMP exit
.endif
MOV EAX, begin
.if EAX > EBX
	MOV EAX, 0
	JMP exit
.endif
	

;начинаем преобразовывать строку
MOV ESI, orig ; помещаем адрес начала исходной строки
MOV EDI, cutted ; помещаем адрес начала подстроки
ADD ESI, begin ; переносим адрес на адрес элемента, с которого начинается подстрока
MOV ECX, lenght ; поместили в счетчик количество элементов в подстроке
CLD ; установили флаг DF = 0, для того, чтобы идти по строке прямым ходом
REP MOVSB ; копируем из ESI в EDI подстроку  
MOV EAX, 1 

exit:
pop ebp
ret
cut endp
end 
