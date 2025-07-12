.model small
.stack 100h
.data
array db 1h,2h,3h ;3 elements of array
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 2 ; for print

    mov dl, array ; print first element
    int 21h

    mov dl, 0Ah ; new line
    int 21h
    
    mov dl, array+1 ; print second element
    int 21h

    mov dl, 0Ah ; new line
    int 21h

    mov dl, array+2 ; print third element
    int 21h

    mov dl, 0Ah ; new line
    int 21h

    mov ah, 4ch ; terminate program
    int 21h
main endp
end main
