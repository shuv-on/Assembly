.model small 
.stack 100h
.data
msg db 'Enter any character: $'
msg1 db 'Yor have entered: $' 
lower db 'Lower case is: $'
upper db 'Upper case is: $'
char db ?, '$'
nl db 13, 10, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;Print msg
    lea dx, msg
    mov ah, 9
    int 21h
    
    ;Enter char
    mov ah, 1
    int 21h
    mov char, al
    ;Print newline
    lea dx, nl
    mov ah, 9
    int 21h
    
    ;Print msg1
    lea dx, msg1
    mov ah, 9
    int 21h
    ;Print char 
    lea dx, char
    mov ah, 9
    int 21h
    
    ;Print newline
    lea dx, nl
    mov ah, 9
    int 21h 
    
    ;Check lower or upper
    cmp char, 'a' ;if (char>'a') cout<< upper
    jl check_upper
    cmp char, 'z'
    jg check_upper
    
    ;Print upper
    lea dx, upper
    mov ah, 9
    int 21h
    
    
    sub char, 32 ; Convert lower to upper
    jmp print_result
    
    check_upper:
        cmp char, 'A'
        jl exit
        cmp char, 'Z'
        jg exit
        ;Print lower
        lea dx, lower
        mov ah, 9
        int 21h
        
        
        add char, 32 ; Convert upper to lower
    print_result:
        mov dl, char
        mov ah, 2
        int 21h
        jmp exit
    exit:
        mov ah, 4ch
        int 21h
        
    
main endp
end main