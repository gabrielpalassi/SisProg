> OPCODE
> MNEM
> OP2MNEM
> MNEM2OP


            JP  MAIN
@ /0300

;
; Instrucoes
;

MAIN        LD  OP1         ; AC <= 1
            MM  OPCODE      ; OPCODE <= AC
            SC  OP2MNEM     ; Chama subrotina OP2MNEM

            LD  MNEMJZ      ; AC <= JZ
            MM  MNEM        ; MNEM <= AC
            SC  MNEM2OP     ; Chama subrotina MNEM2OP
HALT        HM  HALT        ; Halt

;
; Entradas, constantes e saida do programa
;

;Entradas & saidas
OPCODE      K   /0000
MNEM        K   /0000
; Constantes
LOAD        k   /8000
C1          K   /0001
C2          k   /0002
OP0         K   /0000       ; 0 
OP1         K   /0001       ; 1 
OP2         K   /0002       ; 2 
OP3         K   /0003       ; 3 
OP4         K   /0004       ; 4 
OP5         K   /0005       ; 5 
OP6         K   /0006       ; 6 
OP7         K   /0007       ; 7 
OP8         K   /0008       ; 8 
OP9         K   /0009       ; 9 
OPA         K   /000A       ; A 
OPB         K   /000B       ; B 
OPC         K   /000C       ; C 
OPD         K   /000D       ; D 
OPE         K   /000E       ; E 
OPF         K   /000F       ; F 
MNEMJP      K   /4A50       ; JP
MNEMJZ      K   /4A5A       ; JZ
MNEMJN      K   /4A4E       ; JN
MNEMLV      K   /4C56       ; LV
MNEMAD      K   /4144       ; AD
MNEMSB      K   /5342       ; SB
MNEMML      K   /4D4C       ; ML
MNEMDV      K   /4456       ; DV
MNEMLD      K   /4C44       ; LD
MNEMMM      K   /4D4D       ; MM
MNEMSC      K   /5343       ; SC
MNEMRS      K   /5253       ; RS
MNEMHM      K   /484D       ; HM
MNEMGD      K   /4744       ; GD
MNEMPD      K   /5044       ; PD
MNEMOS      K   /4F53       ; OS

;
; Subrotinas
;

; Subrotina - OP2MNEM
OP2MNEM     K   /0000       ; Inicio da subrotina
            JP  INST1       ; Pula as variaveis
; Variaveis
OPCODE_C    K   /0000       ; OPCODE comparado
MNEM_O_E    K   MNEMJP      ; Endereco do MNEM do OPCODE comparado
; Instrucoes da subrotina
INST1       LD  OPCODE_C    ; AC <= OPCODE comparado
            SB  OPCODE      ; AC <= AC - OPCODE
            JZ  RETORNO1    ; Se AC = 0 pula para carregamento do mnemonico no AC e retorno da subrotina
; AC != 0
            LD  OPCODE_C    ; AC <= OPCODE comparado
            AD  C1          ; AC <= AC + 1
            MM  OPCODE_C    ; OPCODE comparado <= AC
            LD  MNEM_O_E    ; AC <= Endereco do MNEM do OPCODE comparado
            AD  C2          ; AC <= AC + 2
            MM  MNEM_O_E    ; Endereco do MNEM do OPCODE comparado <= AC
            JP  INST1       ; Pula para inicio do loop
; AC = 0 (Carregamento do mnemonico no AC e retorno da subrotina)
RETORNO1    LD  LOAD        ; AC <= 8000
            AD  MNEM_O_E    ; AC <= AC + Endereco do MNEM do OPCODE comparado
            MM  MNEM_O_L    ; Load para o MNEM do OPCODE comparado <= AC
MNEM_O_L    k   /0000       ; Load para o MNEM do OPCODE comparado
            MM  MNEM        ; MNEM <= AC
            RS  OP2MNEM     ; Retorna da subrotina

; Subrotina - MNEM2OP
MNEM2OP     k   /0000       ; Inicio da subrotina
            JP  INST2       ; Pula as variaveis
; Variaveis
OPCODE_M_C  K   /0000       ; OPCODE do MNEM comparado
MNEM_E      k   MNEMJP      ; Endereco do MNEM comparado
; Instrucoes da subrotina
INST2       LD  LOAD        ; AC <= 8000
            AD  MNEM_E      ; AC <= AC + Endereco do MNEM comparado
            MM  MNEM_E_L    ; Load para o MNEM comparado <= AC
MNEM_E_L    k   /0000       ; Load para o MNEM comparado
            SB  MNEM        ; AC <= AC - MNEM
            JZ  RETORNO2    ; Se AC = 0 pula para carregamento do opcode no AC e retorno da subrotina
; AC != 0
            LD  OPCODE_M_C  ; AC <= OPCODE do MNEM comparado
            AD  C1          ; AC <= AC + 1
            MM  OPCODE_M_C  ; OPCODE do MNEM comparado <= AC
            LD  MNEM_E      ; AC <= Endereco do MNEM comparado
            AD  C2          ; AC <= AC + 2
            MM  MNEM_E      ; Endereco do MNEM comparado <= AC
            JP INST2        ; Pula para inicio do loop
; AC = 0 (Carregamento do opcode no AC e retorno da subrotina)
RETORNO2    LD  OPCODE_M_C  ; AC <= OPCODE do MNEM comparado
            MM  OPCODE      ; OPCODE <= AC
            RS  MNEM2OP     ; Retorna da subrotina
# MAIN;
