.model small
.stack 100h
.code
main proc
     mov bl,30h
    lp:
       mov ah,1
       int 21h
       inc bl
       cmp al,20h
       je exit
       jmp lp
    exit:
        sub bl,31h
        add bl,30h
        mov ah,2
        mov dl,bl
        int 21h
        
        main endp
    end main