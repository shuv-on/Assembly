.model small
.stack 100h
.data
msg db 'Enter a number: $'
print db 'Your number is: $'
.code
    main proc 
         mov ax, @data
         mov ds, ax

         lea dx, msg
         mov ah, 9
         int 21h

         ;User input
         mov ah, 1
         int 21h
         mov bl, al  ; Store the input character in dl

         ; Print new line
         mov ah, 2
         mov dl, 10
         int 21h
         mov dl,13
         int 21h

         ; Print entered number
         lea dx, print
         mov ah, 9
         int 21h

         mov ah, 2
         mov dl, bl
         int 21h

         ;Exit Dos
         mov ah,4ch
         int 21h



    main endp
end main 