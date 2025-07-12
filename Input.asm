.model small
.stack 100h
.data

.code
main proc
    mov ah, 01h ; Take input
    int 21h

    ; New line
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    ; Print the input character
    mov ah, 02h
    mov dl, al
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
