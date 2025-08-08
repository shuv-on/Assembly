.model small
.stack 100h
.data
rows dw 3
nl db 13, 10, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov bx, rows

    row_loop:  
        mov cx, 80
    star_loop: 
        mov ah, 2
        mov dl, '*'
        int 21h
        loop star_loop
        
        dec bx 
        jnz row_loop
    exit:
        mov ah, 4ch
        int 21h

main endp
end main 