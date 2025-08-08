.model small
.stack 100h
.data
msg db 'Enter a number (0-9): $'
nl  db 13,10,'$'
oddmsg db 13, 10, 'O$'
evenmsg db 13, 10,  'E$'
num db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Prompt message
    lea dx, msg
    mov ah, 9
    int 21h
    
    ; Take single digit input
    mov ah, 1
    int 21h
    sub al, 30h        ; ASCII → number
    mov num, al
    
    ; Prepare for division
    mov ah, 0          ; AH=0, so AX = AL
    mov bl, 2
    div bl             ; AL/BL → AL=quotient, AH=remainder
    
    cmp ah, 1          ; remainder == 1 ?
    je print_odd
    
print_even:
    lea dx, evenmsg
    mov ah, 9
    int 21h
    jmp done

print_odd:
    lea dx, oddmsg
    mov ah, 9
    int 21h

done:
    mov ah, 4ch
    int 21h

main endp
end main
