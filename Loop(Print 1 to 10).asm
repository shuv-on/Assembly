.model SMALL
.stack 100h 
.DATA
msg db 'Printing numbers from 1 to 10$'
.CODE
main PROC
    mov ax, @data 
    mov ds, ax

    ;display message
    mov ah, 9
    lea dx, msg
    int 21

    ;Print numbers
    mov cx, 9
    mov ah, 2
    mov dl, '1'


    ;Print numbers from 1 to 9
    lvl1:
        int 21h
        inc dl
        loop lvl1

    mov cx, 2
    mov ah, 2
    mov dl, '1'

    ;Print number 10
    lvl2:
        int 21h
        dec dl
        loop lvl2
    exit:
        mov ah, 4CH
        int 21h
main ENDP
end main 


