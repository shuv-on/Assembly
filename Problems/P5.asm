.model small
.stack 100h
.data
nl db 13, 10, '$'
count db 0 ; count=0
.code
main proc
    mov ax, @data
    mov ds, ax
    
    loop:
        mov ah, 1
        int 21h
        cmp al, ' '
        je output
        inc count ; count++
        jmp loop 
        
     output:
        lea dx, nl
        mov ah, 9
        int 21h
        
        ; Convert num ascii
        mov al, count
        add al, '0' ; decimal to ascii
        mov dl, al
        mov ah, 2
        int 21h
        jmp exit
     
     exit:
        mov ah, 4ch
        int 21h
main endp
end main