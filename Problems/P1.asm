.model small
.stack 100h
.data
msg db 'Enter any character: $'
nl db 13, 10, '$'
display db 13, 10, 'you have entered: $'
lower db 13, 10, 'Lower is: $'
upper db 13, 10, 'Upper is: $' 
char db ?
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Print msg
    lea dx, msg
    mov ah, 9
    int 21h
    ; Take input store in char var
    mov ah, 1
    int 21h
    mov char, al 
    ; Display input char
    lea dx, display
    mov ah, 9
    int 21h
    
    mov ah, 2 
    mov dl, char
    int 21h     
    
    ; Check if (char<'a')
    cmp char, 'a'
    jl check_upper
    
    ; else 
    sub char, 32 ; Convert to upper
    jmp result
    
    
    check_upper:
        cmp char, 'A'
        jl exit
       
        
        lea dx, lower
        mov ah, 9
        int 21h
        ; Print lower
        add char, 32 ; Convert to lower
         mov ah, 2
         mov dl, char
         int 21h
        jmp exit

      ; Pritn upper   
     result:

        lea dx, upper 
        mov ah, 9
        int 21h
        mov ah, 2
        mov dl, char
        int 21h
        
      exit:
        mov ah, 4ch
        int 21h
    
    
    
main endp
end main