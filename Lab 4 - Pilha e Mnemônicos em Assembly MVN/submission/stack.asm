> EMPI
> DEMP
> MAIN
> VALOR

            JP  MAIN
@ /0100

;
; Definições
;

LOAD        K   /8000  
C2          K   /0002
GETPOINTER  K   /0000
SETPOINTER  K   /0001
GETSTACKTOP K   /0002  
SETSTACKTOP K   /0003  
VALOR       K   /0000 

;
; Instrucoes
;

MAIN        GD  /0000       ; Le do teclado
            SC  EMPI
            SC  DEMP
            LD  VALOR
            PD  /0100       ; Escreve na tela
HALT        HM  HALT

;
; Subrotinas
;

; Subrotina - EMPI
EMPI        K   /0000
INST_EMPI   MM  ARG_EMPI    ; ARG_EMPI <= AC
            LD  SETSTACKTOP ; AC <= SETSTACKTOP
            JP  OS_EMPI     ; Pula as variaveis
ARG_EMPI    K   /0000
OS_EMPI     OS  /157        ; Conteudo(SP) <= AC
            LD  GETPOINTER  ;
            OS  /057
            SB  C2          ; AC <= AC - 2
            MM  ARG_EMPI2   ; ARG_EMPI2 <= SP
            LD  SETPOINTER  ; AC <= SETPOINTER
            JP  OS_EMPI2
ARG_EMPI2   K   /0000
OS_EMPI2    OS  /157
            RS  EMPI

; Subrotina - DEMP
DEMP        K   /0000
            LD  GETPOINTER 
            OS  /057
            AD  C2          ; AC <= AC + 2
            MM  ARG_DEMP 
            LD  SETPOINTER 
            JP  OS_DEMP
ARG_DEMP    K   /0000   
OS_DEMP     OS  /157
            LD  GETPOINTER 
            OS  /057        ; AC <= SP
            AD  LOAD        ; AC <= AC + LOAD
            MM  INSTRUCAO    
INSTRUCAO   LD  /0000
            MM  VALOR       ; VALOR <= AC
            RS  DEMP   

# MAIN