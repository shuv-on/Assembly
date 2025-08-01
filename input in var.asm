.model small
.stack 100h
.data 
msg db 'Enter a number: $'
num db ?
.code 
    main proc
        mov ax, @data
        mov ds, ax

        lea dx, msg
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        sub al, '0'
        mov num,al
        
        mov ah, 2
        mov dl,10
        int 21h
        mov dl, 13
        int 21h

        ;Print number
        mov ah, 2
        mov dl, num
        add dl, '0'
        int 21h

        mov ah, 4ch
        int 21h
    main endp
end main 

