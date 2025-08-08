.model small
.stack 100h
.data
msg db 'Enter any character : $'
char db , '$'
nl db 13, 10, '$'
.code
main proc 
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    mov char, al

   cmp char, 'a'
   jl check_upper

   jmp exit

   check_upper:
            lea dx, nl
            mov ah, 9
            int 21h 

            mov ah, 2
            mov dl, char
            int 21h
            jmp exit
    exit:
        mov ah, 4ch
        int 21h
main endp
end main 