.model small
.stack 100h

.data
     A db 2,4,6,8,10,12,14,16,18,20
     C db 4,6,8,10,12,14,16,18,20,22
     B db 10 dup(?)
     msg db "Array B Output: $"
     
.code
main proc
     mov ax, @data
     mov ds, ax
     
     mov cx, 10
     mov si, 0
     
calc_loop:
     ; Part 1: (A[si] * 3) + 1
     mov al, A[si]
     mov bl, 3
     mul bl
     add al, 1
     mov dl, al
     
     ; Part 2: (C[si] * 2) + 1
     mov al, C[si]
     mov bl, 2
     mul bl
     add al, 1
     mov dh, al
      
     ; Part 3: (A[si] + C[si]) / 2
     mov al, A[si]
     add al, C[si]
     mov ah, 0
     mov bl, 2
     div bl
      
     add al, dl
     add al, dh
     mov B[si], al
      
     inc si
     loop calc_loop

     mov ah, 09h
     lea dx, msg
     int 21h

     mov cx, 10
     mov si, 0

print_loop:
     mov al, B[si]
     mov ah, 0
     mov bl, 10
     div bl
     mov bh, ah

     cmp al, 10
     jl two_digits

     mov ah, 0
     div bl
     mov ch, ah

     ; Forst digit print
     mov dl, al
     add dl, 48
     mov ah, 02h
     int 21h

     ; Second digit print
     mov dl, ch
     add dl, 48
     mov ah, 02h
     int 21h
     jmp last_digit

two_digits:
     mov dl, al
     add dl, 48
     mov ah, 02h
     int 21h

last_digit:
     mov dl, bh
     add dl, 48
     mov ah, 02h
     int 21h

     mov dl, ' '
     mov ah, 02h
     int 21h

     inc si
     dec cl
     jnz print_loop
      
     mov ah, 4ch
     int 21h
main endp
end main