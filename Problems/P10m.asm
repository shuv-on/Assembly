.model small
.stack 100h
.data
.code
main proc
   mov cx,0
   
input:
   mov ah,1
   cmp al,13
   je end_loop
   push ax
   inc cx
   int 21h
   jmp input
end_loop:
   jcxz exit
   
print:
   mov ah,2
   pop dx
   int 21h
   loop print
exit:
   mov ah,4Ch
   int 21h
main endp
end main