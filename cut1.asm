.386
.MODEL FLAT, C


EXTERN	lstrlenA@4:			PROC

.DATA
	begin	DD ? ; ������ �� ������ ��������� � ������
	lenght	DD ? ; ����� ���������
	orig	DD ? ; ����� �������� ������
	cutted	DD ? ; ����� ���������
	
.CODE
cut PROC
; ������� ����������
PUSH EBP
MOV EBP, ESP
MOV EAX,[EBP]+8; +8 ������ ��� � ���������� 8 ����� �������� ��������� �� ������������ ����������
MOV orig,EAX
MOV EAX,[EBP]+12
MOV cutted,EAX
MOV EAX,[EBP]+16
SUB EAX,1
MOV begin,EAX
MOV EAX,[EBP]+20
MOV lenght,EAX

;�������� ������ �� ������� �������
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
	

;�������� ��������������� ������
MOV ESI, orig ; �������� ����� ������ �������� ������
MOV EDI, cutted ; �������� ����� ������ ���������
ADD ESI, begin ; ��������� ����� �� ����� ��������, � �������� ���������� ���������
MOV ECX, lenght ; ��������� � ������� ���������� ��������� � ���������
CLD ; ���������� ���� DF = 0, ��� ����, ����� ���� �� ������ ������ �����
REP MOVSB ; �������� �� ESI � EDI ���������  
MOV EAX, 1 

exit:
pop ebp
ret
cut endp
end 
