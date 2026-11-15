.model small
.stack 100h

.data
     A db 2,4,6,8,10,12,14,16,18,20
     C db 4,6,8,10,12,14,16,18,20,22
     B db 10 dup(?)
     
.code
main proc
     mov ax, @data
     mov ds, ax
     
     mov cx, 10
     mov si, 0
     
 Loop:
     mov al, A[si]
     mov bl, 3
     mul bl
     add al, 1
     mov dl, al
     
    
     mov al, C[si]
     mov bl,2
      mul bl
      add al,1
      mov dh, al
      
      mov al, A[si]
      add al, C[si]
      mov ah, 0
      mov bl, 2
      div bl
      
      add al, dl
      add al, dh
      mov B[si], al
      
      inc si
      loop Loop
      
     mov ah, 4ch
     int 21h
main endp
end main
      
    