.model small
.stack 100h

.data
msg db "Hello, World!$"

.code
main:
    mov ah, 9
    lea dx, msg
    int 21h

    mov ah, 4ch
    int 21h
end main
