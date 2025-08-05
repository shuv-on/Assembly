.model small 
.stack 100H
.data 
msg db 'Printing alphabet from a to z: $'
.code 
main proc
    mov ax, @data
    mov ds, ax

    ; Displaty message
    mov ah, 9
    lea dx, msg
    int 21h

    ; Print alphanet
    mov cx, 26
    mov ah, 2
    mov dl, 'a'

    lvl1:
        int 21h
        inc dl
        loop lvl1

main endp 
end main