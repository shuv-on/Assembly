.model small
.stack 100h
.data
msg db 'Enter a number: $'
.code
main proc 
    mov ax, @data 
    mov ds, ax

    lea dx, msg
    mov ah,9

    