.model small
.stack 100h
.data
msg db 'Enter a character: $'
char db ? ,'$'
nl db 13, 10,'$' 
y db 'y$'
cap_Y db 'Y$'
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ;Print msg
    lea dx, msg
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov char, al
    
    ;if (char=='y' || char=='Y')
    ;cout<<char
    ;else return 0
    
    
    ;Print newline
    lea dx, nl
    mov ah, 9
    int 21h
    
    cmp char, 'y'
    je print_y
    
    cmp char, 'Y'
    je print_cap_Y
    
    jmp exit
    
    ;Print y
    print_y:
        lea dx, y
        mov ah, 9
        int 21h
        jmp exit
        
     ;Print Y
     print_cap_Y:
        lea dx, cap_Y
        mov ah, 9
        int 21h
        jmp exit 
      
     ;DOS exit
      exit:
        mov ah, 4ch
        int 21h
    
main endp
end main