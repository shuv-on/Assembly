.model small
.stack 100h
.data 
msg1 db 13, 10, 'Enter first number: $'
msg2 db 13, 10, 'Enter second number: $'
num1 db ?
num2 db ?
msg3 db '?$'
nl db 13, 10, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;msg3
    lea dx, msg3
    mov ah, 9
    int 21h

    ;Print msg1
    lea dx, msg1
    mov ah, 9
    int 21h
     
    ;Enter first number
    mov ah, 1
    int 21h
    sub al, '0'
    mov num1, al
    
    ;Print msg2
    lea dx, msg2
    mov ah, 9
    int 21h
    
    ;Enter second number
    mov ah, 1
    int 21h
    sub al, '0'
    mov num2, al
    
    ;Newline 
    lea dx, nl
    mov ah, 9
    int 21h

    ; ADD two numbers
    mov al, num1
    add al, num2

    cmp al, 10
    jl print

    jmp exit
    print:
        add al, '0'
        mov ah, 2
        mov dl, al
        int 21h
        jmp exit
    exit:
        mov ah, 4ch
        int 21h    
    

main endp
end main