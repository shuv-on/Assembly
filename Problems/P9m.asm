.model small
.stack 100h
.data
    msg1 db 'Enter a hex digit (0-9, A-F): $'
    okmsg db 13,10, 'Valid hex digit!$'
    errmsg db 13,10, 'Not a hex digit!$'
    failmsg db 13,10, 'You failed 3 times. Program terminated.$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 3           ; ৩ বার চেষ্টা করার সুযোগ

try_input:
    ; মেসেজ দেখাও
    lea dx, msg1
    mov ah, 9
    int 21h

    ; ইনপুট নাও
    mov ah, 1
    int 21h
    mov bl, al          ; BL এ ইনপুট রাখা

    ; চেক করো এটা valid hex কিনা
    ; 0-9 হলে ঠিক
    cmp bl, '0'
    jl not_hex
    cmp bl, '9'
    jle is_hex

    ; A-F হলে ঠিক
    cmp bl, 'A'
    jl not_hex
    cmp bl, 'F'
    jle is_hex

not_hex:
    ; ভুল হলে errmsg দেখাও
    lea dx, errmsg
    mov ah, 9
    int 21h
    loop try_input      ; আবার চেষ্টা (CX কমে যাবে)
    
    ; তিনবার ব্যর্থ হলে
    lea dx, failmsg
    mov ah, 9
    int 21h
    jmp exit_program

is_hex:
    lea dx, okmsg
    mov ah, 9
    int 21h
    jmp exit_program

exit_program:
    mov ah, 4Ch
    int 21h

main endp
end main
