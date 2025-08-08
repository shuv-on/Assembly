.model small
.stack 100h
.data
display db '"?"$'
msg1 db 13, 10, 'Enter first capital letter: $'
msg2 db 13, 10, 'Enter second capital letter: $'
msg3 db 13, 10, 'Alphabetical order is: $'
char1 db ?
char2 db ?
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, display
    mov ah, 9
    int 21h

    ;First letter
    lea dx, msg1
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    mov char1, al

    ;Second letter
    lea dx, msg2
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    mov char2, al

    ;Compare
    mov al, char1
    mov bl, char2
    cmp al, bl
    jbe no_swap

    ; Swap
    mov char1, bl
    mov char2, al

    no_swap:
        ;Print result
        lea dx, msg3
        mov ah, 9
        int 21h

        mov ah, 2
        mov dl, char1
        int 21h

        mov dl, char2
        int 21h

    ;Exit
    exit: 
        mov ah, 4ch
        int 21h
        


    


main endp
end main