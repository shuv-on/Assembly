.model small
.stack 100h
.data
msg  db 'Enter a hex char: $'
msg2  db 'you tried three times $'
newl db 13,10,'$'


.code
main proc
   mov ax,@data
   mov ds,ax
   mov cx,3
loop_:
   lea dx,msg
   mov ah,9
   int 21h
   mov ah,1
   int 21h
   
   cmp al,'0' 
   jg nine
nine:
   cmp al,'9'
   jbe exit
   jg char
char:
   cmp al,'A'
   jg fff
fff:
   cmp al,'F'
   jbe exit


   lea dx,newl
   mov ah,9
   int 21h


   loop :
   lea dx,msg2
   mov ah,9
   int 21h
  
exit:
   mov ah,4Ch
   int 21h
main endp
end main