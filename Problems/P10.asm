.model small
.stack 100h
.data 
msg1 db 'Enter string : $'
msg2 db 13, 10, 'Your entered string is: $'
msg3 db 13, 10, 'Reverse string is: $'
str db 5 dup(?) 
.code
    main proc
        mov ax, @data
        mov ds, ax

        lea dx, msg1
        mov ah, 9
        int 21h

        mov cx, 5
        mov si, offset str

        input:
            mov ah, 1
            int 21h
            mov [si], al
            inc si

            loop input


        lea dx, msg2
        mov ah, 9
        int 21h
        
        mov cx, 5
        mov si, offset str

        output:
            mov ah, 2
            mov dl, [si]
            int 21h
            inc si
            
            ;Print Space
            mov ah, 2
            mov dl, 32
            int 21h 

            loop output

        ;Reverse

        mov cx, 5
        mov si, offset str

        stack_push:
            mov bx, [si]
            push bx
            inc si

            loop stack_push
        
        mov ah, 9
        lea dx, msg3
        int 21h

        mov cx, 5

        stack_pop: 
            mov ah, 2
            pop dx
            int 21h

            ;Print space
            mov ah, 2
            mov dl, 32
            int 21h

            loop stack_pop

        exit:
            mov ah, 4ch
            int 21h


    main endp
end main 