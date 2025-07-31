.model small
.stack 100h
.data 
lr equ 0Dh
lf equ 0Ah

msg1 db 'Enter a lower case letter: $'
msg2 db lr,lf, 'In upper case it is: '
char db ?, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    ;Print Msg1 
    lea dx, msg1
    mov ah,9
    int 21h

    ; Teake input lower letter
    mov ah, 01h
    int 21h

    ;Convert lower to upper ,,,, if we sub 20h hex value from lower case letter it will become upper case letter
    sub al, 20h
    mov char, al

    ;Print the converted upper case letter
    lea dx, msg2
    mov ah,9
    int 21h

    ;Exit Dos
    mov ah, 4ch
    int 21h
    main endp
end main
