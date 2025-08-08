.model small 
.stack 100h 
.data 
msg db '******$', 10, 13
.code 
main proc

    mov ax, @data
    mov ds, ax

   
    

    mov cx, 5
    a: 
        mov ah, 9
        lea dx, msg
        int 21h
       
        mov ah, 2
        mov dl, 13
        int 21h
        mov dl, 10
        int 21h
        loop a
    exit: 
        mov ah, 4ch
        int 21h

main endp
end main 