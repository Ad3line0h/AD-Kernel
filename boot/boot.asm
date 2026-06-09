[org 0x7C00]
[bits 16]

mov si, msg
call print

call load_kernel    
call switch_to_pm    

jmp $


print:
    .loop:
        lodsb
        cmp al, 0
        je .done
        mov ah, 0x0E
        int 0x10
        jmp .loop
    .done:
        ret


load_kernel:
    xor ax, ax      ; ax = 0
    mov es, ax      ; es = 0 (es:bx 주소 설정)
    mov ah, 0x02    
    mov al, 1       
    mov ch, 0       
    mov cl, 2       
    mov dh, 0      
    mov dl, 0x00    
    mov bx, 0x1000  
    int 0x13        
    ret

msg db 'Switching to 32-bit...', 0

%include "boot/gdt.asm"

switch_to_pm:
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax
    jmp CODE_SEG:init_pm

[bits 32]
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov esp, 0x90000

    jmp 0x1000      ; 커널 이동

times 510-($-$$) db 0
dw 0xAA55
