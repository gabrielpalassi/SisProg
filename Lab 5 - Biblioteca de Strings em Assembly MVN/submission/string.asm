> STRLEN
> STRCMP
> STRCMP_A
> STRCMP_B

;
; Definições
;

C0          K   /0000
C1          K   /0001
C2          K   /0002
C-1         K   /FFFF 
LOAD        K   /8000 
ENDERECO    K   /0000 
TAMANHO     K   /0000   
SOMA_A      K   /0000  
SOMA_B      K   /0000 
STRCMP_A    K   /0000
STRCMP_B    K   /0000

;
; Subrotinas
;

; Subrotina - STRLEN
STRLEN      K   /0000
ENDERECO_M  MM  ENDERECO
            AD  LOAD
            MM  INSTRUCAO1
INSTRUCAO1  K   /0000
            JZ  FINAL
            LD  TAMANHO
            AD  C1
            MM  TAMANHO
            LD  ENDERECO
            AD  C2
            JP  ENDERECO_M
FINAL       LD  TAMANHO
            RS  STRLEN

; Subrotina - STRCMP
STRCMP      K   /0000
            JP  STRCMP_I
; Variaveis
ENDERECO_A  K   /0000
ENDERECO_B  K   /0000
; Instrucoes da subrotina
STRCMP_I    LD  STRCMP_A
            MM  ENDERECO_A
LOAD_A      LD  ENDERECO_A
            AD  LOAD
            MM  INSTRUCAO2
INSTRUCAO2  LD  /0000  
            JZ  FINAL_A
            AD  SOMA_A
            MM  SOMA_A
            LD  ENDERECO_A
            AD  C2
            MM  ENDERECO_A
            JP  LOAD_A
FINAL_A     LD  STRCMP_B
            MM  ENDERECO_B
LOAD_B      LD  ENDERECO_B
            AD  LOAD
            MM  INSTRUCAO3
INSTRUCAO3  LD  /0000  
            JZ  FINAL_B
            AD  SOMA_B
            MM  SOMA_B
            LD  ENDERECO_B
            AD  C2
            MM  ENDERECO_B
            JP  LOAD_B
FINAL_B     LD  SOMA_A
            SB  SOMA_B
            JZ  IGUAL
            JN  MENOR
            LD  C1
            JP  MAIOR
MENOR       LD  C-1
            JP  MAIOR
IGUAL       LD  C0
MAIOR       RS  STRCMP

# STRING