.model small
.stack 100h
.data
char1 db ?
char2 db ?
nl db 13, 10, '$' 
.code 
main proc 
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov char1, al
    
    mov ah, 1
    int 21h
    mov char2, al
    
    mov al, char1
    mov bl, char2
    
    cmp al, bl
    jl no_swap
    
    mov char1, bl
    mov char2, al 
    mov ah, 2
    mov dl, char1
    int 21h
    mov dl, char2
    int 21h
    
    
    jmp exit
    
    no_swap:   
        mov ah, 2
        mov dl, al
        int 21h
       
        mov dl, bl
        int 21h
        jmp exit
    exit:
        mov ah, 4ch
        int 21h
    
    
    
main endp
end main