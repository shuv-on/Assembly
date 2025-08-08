.model small
.stack 100h
.data
o db 'o$'
e db 'e$'
nl db 13, 10, '$'
msg db 'Enter number: $'
num db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;Print msg1
    lea dx, msg
    mov ah, 9
    int 21h
    
    ;Enter  number
    mov ah, 1
    int 21h
    sub al, '0'
    mov num, al
     
    ;Print newline
    lea dx, nl
    mov ah, 9
    int 21h
     
    
    
    ;if (num==1||num==3)
    ;cout<<"o"
    ;if (num==2||num==4) 
    ;cout<<"e"
    
    
    ;if (num==1||num==3) in assembly it willl be cmp num, 1
    cmp num, 1
    je print_o
    
    cmp num, 3
    je print_o
    
    ;if(num==2||num==4) cout<<"e"
    cmp num, 2
    je print_e
    
    cmp num, 4
    je print_e
    
    print_o:
          lea dx, o
          mov ah, 9
          int 21h 
          jmp exit
    print_e:
          lea dx, e
          mov ah, 9
          int 21h 
          jmp exit
    exit:
        mov ah, 4ch
        int 21h
    
    
    
main endp
end main