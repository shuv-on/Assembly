.model small
.stack 100h
.data
f db 'Enter first number: $'
s db  10,13, 'Enter second number: $' ;10, 13 for new line and carriage return
result db 10,13, 'The sum is: $'
.code 
    main proc
        mov ax, @data
        mov ds, ax

        ; Input first number
        lea dx, f
        mov ah, 9
        int 21h

        mov ah,1
        int 21h
        mov bl, al

        ; Input second number
        lea dx, s
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        mov bh, al

        ; Calculate sum
        add bl, bh ;bl=bl+al
        sub bl, '0' ; Convert ASCII to integer

        ; Print result
        lea dx, result
        mov ah, 9
        int 21h

        mov ah, 2
        mov dl, bl
        int 21h

        mov ah, 4ch
        int 21h
        
        main endp
end main

        
