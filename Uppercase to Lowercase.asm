.model small
.stack 100h
.data
lr equ 0Dh
lf equ 0Ah
msg1 db 'Enter your Uppercase letter: $'
msg2 db lr,lf, 'In lowercase it is: '
char db ?, '$'
.code
main proc 
    mov ax, @data
    mov ds, ax

    ;Print msg1
    lea dx, msg1
    mov ah,9
    int 21h

    ;take Uppercase leeter input
    mov ah, 01h
    int 21h

    ;Convert upper to lowercase 
    add al, 20h
    mov char, al

    ;Print the lowercase letter
    lea dx, msg2
    mov ah, 9
    int 21h

    ;Exit Dos
    mov ah, 4ch
    int 21h
    main endp
end main