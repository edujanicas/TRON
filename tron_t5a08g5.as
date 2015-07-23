;####################################
;# ZONA I: Definicao de constantes  #
;#        Pseudo-instrucao : EQU    #
;####################################

;-----------------------------I/O:
IO_WRITE        EQU     FFFEh
IO_CURSOR       EQU     FFFCh
INT_READ        EQU     FFF9h
LED_DISPLAY     EQU     FFF8h
TIMER_CONTROL   EQU     FFF7h
TIMER_VALUE     EQU     FFF6h
LCD_WRITE       EQU     FFF5h
LCD_CONTROL     EQU     FFF4h
IO_DISPLAY      EQU     FFF0h

LIMPA_JANELA    EQU     FFFFh
XY_INICIAL1     EQU     0C20h
XY_INICIAL2     EQU     0D1Ch
XY_INICIALE1    EQU     0C22h
XY_INICIALE2    EQU     0D16h
XY_Tron1        EQU     0104h
XY_Tron2        EQU     0204h
XY_Tron3        EQU     0304h
XY_Tron4        EQU     0404h
XY_Tron5        EQU     0504h
XY_Tron6        EQU     0704h
XY_Tron7        EQU     0804h
XY_Tron8        EQU     0904h
XY_Tron9        EQU     0A04h
XY_Tron10       EQU     0B04h
XY_Tron11       EQU     0D04h
XY_Tron12       EQU     0E04h
XY_Tron13       EQU     0F04h
XY_Tron14       EQU     1004h
XY_Tron15       EQU     1104h
XY_Tron16       EQU     1304h
XY_Tron17       EQU     1404h
XY_Tron18       EQU     1504h
XY_Tron19       EQU     1604h
XY_Tron20       EQU     1704h
ASCII           EQU     48d
ASCII10         EQU     58d

;-----------------------------SP:
SP_INICIAL      EQU     FDFFh

;-----------------------------INTERRUPCOES:
INT_MASK_ADDR   EQU     FFFAh
INT_MASK        EQU     8A83h
TAB_INT0        EQU     FE00h
TAB_INT1        EQU     FE01h
TAB_INT7        EQU     FE07h
TAB_INT9        EQU     FE09h
TAB_INTB        EQU     FE0Bh

;-----------------------------TEMPORIZACAO:
NIBBLE_MASK     EQU     000fh
NUM_NIBBLES     EQU     4
BITS_PER_NIBBLE EQU     4
DELAY           EQU     1
SEGUNDO         EQU     10d

;-----------------------------MATRIZ REPLICA EM MEMORIA:
SIZECOL         EQU     0050h
SIZEMATRIZ      EQU     0780h

;-----------------------------MOLDURA E JOGADORES:
COLUNA_E        EQU     0010h
COLUNA_D        EQU     0040h
LINHA_C         EQU     0100h
LINHA_B         EQU     1600h
LIN_SEG         EQU     0100h
LIN_ANT         EQU     -100h
CSE             EQU     0110h
CSD             EQU     0140h
CIE             EQU     1610h
CID             EQU     1640h
CSE2            EQU     0316h
CSD2            EQU     0339h
CIE2            EQU     1316h
CID2            EQU     1339h
CSE3            EQU     0116h
CSD3            EQU     0139h
CIE3            EQU     1616h
CID3            EQU     1639h
CSE4            EQU     0310h
CSD4            EQU     0340h
CIE4            EQU     1310h
CID4            EQU     1340h
P1_INIC         EQU     0B17h
P2_INIC         EQU     0B38h
LCDTMAX         EQU     800Ch
LCDJ1           EQU     8015h
LCDJ2           EQU     801Eh

;---------------------------CARACTERES:
FIM_TEXTO       EQU     '?'
MOLDURACANTO    EQU     '+'
MOLDURACB       EQU     '-'
MOLDURAED       EQU     '|'
PLAYER1         EQU     'X'
PLAYER2         EQU     '#'
EXPLOSAO1       EQU     'O'
EXPLOSAO2       EQU     '+'
EXPLOSAO3       EQU     '*'
EXPLOSAO4       EQU     '.'
EXPLOSAO5       EQU     'o'
ESPACO          EQU     ' '
CIMA            EQU     'C'
BAIXO           EQU     'B'
ESQUERDA        EQU     'E'
DIREITA         EQU     'D'
VER             EQU     'V'
GRAVAR          EQU     'G'
OCUPADO         EQU     'O'
LIVRE           EQU     'L'
LINHA           EQU     'L'
COLUNA          EQU     'C'
GRANDE          EQU     'G'
PEQUENA         EQU     'P'
CPEQUENA        EQU     'C'
LPEQUENA        EQU     'L'

;################################################################
;# ZONA II: definicao de variaveis                              #
;#         Pseudo-instrucoes : WORD - palavra (16 bits)         #
;#                             STR  - sequencia de caracteres.  #
;#         Cada caracter ocupa 1 palavra                        #
;################################################################

                ORIG    8000h
StartGame1      STR     'Bem-Vindo ao TRON', FIM_TEXTO
StartGame2      STR     'Pressione I1 para comecar', FIM_TEXTO
EndGame1        STR     'Jogo terminou', FIM_TEXTO
EndGame2        STR     'Prima o interruptor I1 para recomecar', FIM_TEXTO
LCD_1           STR     'TEMPO MAX: ', FIM_TEXTO
LCD_2           STR     's', FIM_TEXTO
LCD_3           STR     'J1: ', FIM_TEXTO
LCD_4           STR     'J2: ', FIM_TEXTO
NUMEROS         STR     '0123456789', FIM_TEXTO
Tron1           STR     '@@@@@@@', FIM_TEXTO
Tron2           STR     '  @!!', FIM_TEXTO
Tron3           STR     '  @!!', FIM_TEXTO
Tron4           STR     '  !!:', FIM_TEXTO
Tron5           STR     '   :', FIM_TEXTO
Tron6           STR     '@@@@@@@', FIM_TEXTO
Tron7           STR     '@@!  @@@', FIM_TEXTO
Tron8           STR     '@!@!!@!', FIM_TEXTO
Tron9           STR     '!!: :!!', FIM_TEXTO
Tron10          STR     ' :   : :', FIM_TEXTO
Tron11          STR     ' @@@@@@', FIM_TEXTO
Tron12          STR     '@@!  @@@', FIM_TEXTO
Tron13          STR     '@!@  !@!', FIM_TEXTO
Tron14          STR     '!!:  !!!', FIM_TEXTO
Tron15          STR     ' : :. :', FIM_TEXTO
Tron16          STR     '@@@  @@@', FIM_TEXTO
Tron17          STR     '@@!@!@@@', FIM_TEXTO
Tron18          STR     '@!@@!!@!', FIM_TEXTO
Tron19          STR     '!!:  !!!', FIM_TEXTO
Tron20          STR     '::    :', FIM_TEXTO
TMAXDEC         WORD    0
VJ1             WORD    0
VJ2             WORD    0
TTOTAL          WORD    0
CONTADOR        WORD    1
VAR_TIMER       WORD    0
C10             WORD    0
NIVEL           WORD    7
COL1            WORD    0
COL2            WORD    0
PONTOS1         WORD    0
PONTOS2         WORD    0
EXP             WORD    0
INT_P1          WORD    0
INT_P2          WORD    0
INT_I1          WORD    0
ULT_MOV1        WORD    0
ULT_MOV2        WORD    0
POS1            WORD    0
POS2            WORD    0
CONTAGEM        WORD    0
COLIDIU         WORD    0
MOLDURAGP       WORD    0
LCD_DEC1        WORD    48d
LCD_DEC2        WORD    48d
MATRIZ          TAB     2000h


;################################################################
;# ZONA III: Tabela de Interrupcoes                             #
;#         Pseudo-instrucoes : WORD - palavra (16 bits)         #
;#                             ORIG                             #
;#                                                              #
;################################################################

                ORIG    FE00h
INTO            WORD    RotinaInt0
INT1            WORD    RotinaInt1
                ORIG    FE07h
INT7            WORD    RotinaInt7
                ORIG    FE09h
INT9            WORD    RotinaInt9
                ORIG    FE0Bh
INTB            WORD    RotinaIntB
                ORIG    FE0Fh
INT15           WORD    Temporizador


;################################################################
;# ZONA IV: codigo                                              #
;#        conjunto de instrucoes Assembly, ordenadas de forma   #
;#        a realizar as funcoes pretendidas                     #
;################################################################

                ORIG    0000h
                JMP     Inicio

;================================================================
; RotinaInt0: Rotina de interrupcao 0
;               Entradas: ---
;               Saidas:   M[INT_P1] = 'E'
;               Efeitos: Altera M[INT_P1]
;================================================================
RotinaInt0:     PUSH    R1
                MOV     R1, ESQUERDA
                MOV     M[INT_P1], R1
                POP     R1
                RTI

;================================================================
; RotinaInt1: Rotina de interrupcao 1
;               Entradas: ---
;               Saidas:   M[INT_I1] = 0001h
;               Efeitos: Altera M[INT_I1]
;================================================================
RotinaInt1:     PUSH    R1
                MOV     R1, 1
                MOV     M[INT_I1], R1
                POP     R1
                RTI

;================================================================
; RotinaInt7: Rotina de interrupcao 7
;               Entradas: ---
;               Saidas:   M[INT_P2] = 'E'
;               Efeitos: Altera M[INT_P2]
;================================================================
RotinaInt7:     PUSH    R1
                MOV     R1, ESQUERDA
                MOV     M[INT_P2], R1
                POP     R1
                RTI

;================================================================
; RotinaInt9: Rotina de interrupcao 9
;               Entradas: ---
;               Saidas:   M[INT_P2] = 'D'
;               Efeitos: Altera M[INT_P2]
;================================================================
RotinaInt9:     PUSH    R1
                MOV     R1, DIREITA
                MOV     M[INT_P2], R1
                POP     R1
                RTI

;================================================================
; RotinaIntB: Rotina de interrupcao B
;               Entradas: ---
;               Saidas:   M[INT_P1] = 'D'
;               Efeitos: Altera M[INT_P1]
;================================================================
RotinaIntB:     PUSH    R1
                MOV     R1, DIREITA
                MOV     M[INT_P1], R1
                POP     R1
                RTI

;================================================================
; Temporizador: Rotina de interrupcao 15 que ocorre a cada 
;               passagem do tempo DELAY
;               Entradas: ---
;               Saidas:   M[Variavel_timer] = 0
;               Efeitos: Altera M[Variavel_timer]
;================================================================
Temporizador:   CALL    Reenicia_timer
                MOV     M[VAR_TIMER], R0
                RTI

;================================================================
; Mensagem: Escreve uma string na janela de texto
;               Entradas: Registos: R5 - String a Escrever; 
;                                   R4 - XY_INICIAL
;               Saidas: ---
;               Efeitos: ---
;================================================================


Mensagem:       PUSH    R6
                PUSH    R7
                MOV     R6, R4
CicloMensagem:  MOV     R7, M[R5]
                CMP     R7, FIM_TEXTO
                BR.Z    FimMensagem
                MOV     M[IO_CURSOR],R6
                MOV     M[IO_WRITE],R7
                INC     R6
                INC     R5
                BR      CicloMensagem
FimMensagem:    POP     R7
                POP     R6
                RET

;================================================================
; ApagaMsg: Apaga uma string na janela de texto
;               Entradas: Registos: R5 - String a Escrever; 
;                                   R4 - XY_INICIAL
;               Saidas: ---
;               Efeitos: ---
;================================================================

ApagaMsg:       PUSH    R6
                PUSH    R7
                PUSH    R3
                MOV     R6, R4
CicloApagaMsg:  MOV     R3, M[R5]
                MOV     R7, ' '
                CMP     R3, FIM_TEXTO
                BR.Z    FimApagaMsg
                MOV     M[IO_CURSOR],R6
                MOV     M[IO_WRITE],R7
                INC     R6
                INC     R5
                BR      CicloApagaMsg
FimApagaMsg:    POP     R3
                POP     R7
                POP     R6
                RETN    0

;================================================================
; MsgInicial: Escreve toda a mensagem incial no ecrã e a apaga
;     de acordo com a interrupcao
;               Entradas: ---
;               Saidas: ---
;               Efeitos: ---
;================================================================

MsgInicial:     PUSH    R1
                PUSH    R4
                PUSH    R5
                MOV     R4, XY_INICIAL1
                MOV     R5, StartGame1
                CALL    Mensagem
                MOV     R4, XY_INICIAL2
                MOV     R5, StartGame2
                CALL    Mensagem
CicloMsgInicial:MOV     R1, 1
                CMP     M[INT_I1],R1
                BR.NZ   CicloMsgInicial
FimMsgInicial:  MOV     R4, XY_INICIAL1
                MOV     R5, StartGame1
                CALL    ApagaMsg
                MOV     R4, XY_INICIAL2
                MOV     R5, StartGame2
                CALL    ApagaMsg
                POP     R5
                POP     R4
                POP     R1
                RET

;================================================================
; MsgFinal: Escreve toda a mensagem final no ecrã e apaga
;   de acordo com a interrupcao
;               Entradas: ---
;               Saidas: ---
;               Efeitos: ---
;================================================================

MsgFinal:       PUSH    R1
                PUSH    R4
                PUSH    R5
                MOV     R4, XY_INICIALE1
                MOV     R5, EndGame1
                CALL    Mensagem
                MOV     R4, XY_INICIALE2
                MOV     R5, EndGame2
                CALL    Mensagem
                MOV     M[INT_I1],R0
CicloMsgFinal:  MOV     R1, 1
                CMP     M[INT_I1],R1
                BR.NZ   CicloMsgFinal
FimMsgFinal:    MOV     R4, XY_INICIALE1
                MOV     R5, EndGame1
                CALL    ApagaMsg
                MOV     R4, XY_INICIALE2
                MOV     R5, EndGame2
                CALL    ApagaMsg
                POP     R5
                POP     R4
                POP     R1
                RET

;================================================================
; LimpaJanela:  Limpa a janela de texto.
;               Entradas: ---
;               Saidas: ---
;               Efeitos: ---
;================================================================
LimpaJanela:    PUSH    R2
                MOV     R2, R0
CicloLJ:        MOV     M[IO_CURSOR], R2
                MOV     R1, ESPACO
                MOV     M[IO_WRITE], R1
                INC     R2
                CMP     R2, FFFFh
                BR.NZ   CicloLJ
                POP     R2
                RET

;================================================================
;   Memoria:    Rotina que manipula a memoria: Diz onde 
;               existem elementos e guarda novos
;               Entradas: Pilha - Ver ou Gravar; Posicao Cursor
;               Saidas: Nada se Gravar, 'O' se ver e Ocupado, 
;                       'L' se ver e Livre
;               Efeitos: Altera a memoria
;================================================================

Memoria:        PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                MOV     R2, R0
                MOV     R4, M[SP+7]         ; R4 - Ver ou Gravar
                MOV     R1, M[SP+6]         ; R1 - Linha
                MVBL    R2, R1              ; R2 - Coluna
                SHRA    R1, 8
                ADD     R2, MATRIZ          ; Somamos R2 ao inicio 
                MOV     R3, SIZECOL         ; da matriz de memoria 
                MUL     R3, R1              ; para obtermos a 
                ENI                         ; coluna da matriz e 
                ADD     R2, R1              ; multiplicamos por R1 
                CMP     R4, GRAVAR          ; para obter a linha
                BR.NZ   VerMem
GravarMem:      MOV     R1, OCUPADO
                MOV     M[R2], R1
                POP     R4
                POP     R3
                POP     R2
                POP     R1
                RETN    2
VerMem:         MOV     R1, OCUPADO
                CMP     M[R2], R1
                BR.NZ   Livre               ; Se o valor guardado na
                MOV     R1, OCUPADO         ; posicao de memoria obti-
                MOV     M[SP+7], R1         ; da for diferente de 0
                BR      FimMem              ; entao existe ja um 
Livre:          MOV     R1, LIVRE           ; caracter nessa posicao
                MOV     M[SP+7], R1
FimMem:         POP     R4
                POP     R3
                POP     R2
                POP     R1
                RETN    1

;================================================================
; ApagaMem: Rotina que apaga a memoria toda no ecra
;               Entradas: ---
;               Saidas: ---
;               Efeitos: Altera a memoria
;================================================================

ApagaMem:       PUSH    R3
                PUSH    R4
                MOV     R3, MATRIZ
                MOV     R4, MATRIZ
                ADD     R4, SIZEMATRIZ
CicloApagaMem:  MOV     M[R3], R0
                INC     R3
                CMP     R3, R4
                JMP.NZ  CicloApagaMem
                POP     R4
                POP     R3
                RET

;================================================================
; PosCantos: Rotina que efectua o posicionamento dos cantos 
;            da moldura de jogo
;               Entradas: ---
;               Saidas: Pequena ou Grande em M[MOLDURAGP]
;               Efeitos: Altera a memoria
;================================================================

PosCantos:      PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                PUSH    R5
                PUSH    R6
                PUSH    R7
MolduraG:       MOV     R3, CSE
                MOV     R4, CSD
                MOV     R5, CIE
                MOV     R6, CID
                MOV     R1, GRANDE
                MOV     M[MOLDURAGP], R1
                MOV     R1, M[INT_READ]
CantosT1:       TEST    R1, 1b
                BR.Z    CantosT2
MolduraCP:      MOV     R3, CSE3
                MOV     R4, CSD3
                MOV     R5, CIE3
                MOV     R6, CID3
                MOV     R1, CPEQUENA
                MOV     M[MOLDURAGP], R1
                BR      CantosT3
CantosT2:       TEST    R1, 10b
                BR.Z    Cantos
MolduraLP:      MOV     R3, CSE4
                MOV     R4, CSD4
                MOV     R5, CIE4
                MOV     R6, CID4
                MOV     R1, LPEQUENA
                MOV     M[MOLDURAGP], R1
                BR      Cantos
CantosT3:       MOV     R1, M[INT_READ]
                TEST    R1, 10b
                BR.Z    Cantos
MolduraP:       MOV     R3, CSE2
                MOV     R4, CSD2
                MOV     R5, CIE2
                MOV     R6, CID2
                MOV     R1, PEQUENA
                MOV     M[MOLDURAGP], R1
Cantos:         MOV     R2, MOLDURACANTO
                MOV     R7, GRAVAR
                MOV     R1, R3
                PUSH    R7                  ; Colocamos o cursor no 
                PUSH    R1                  ; no Canto superior 
                CALL    Memoria             ; esquerdo da moldura 
                MOV     M[IO_CURSOR], R1    ; de jogo e imprimimos 
                MOV     M[IO_WRITE], R2     ; o caracter +
                MOV     R1, R4
                PUSH    R7
                PUSH    R1                  ; Colocamos o cursor no 
                CALL    Memoria             ; Canto superior direito 
                MOV     M[IO_CURSOR], R1    ; da moldura de jogo e 
                MOV     M[IO_WRITE], R2     ; imprimimos o caracter +
                MOV     R1, R5
                PUSH    R7
                PUSH    R1                  ; Colocamos o cursor no 
                CALL    Memoria             ; Canto inferior esquerdo 
                MOV     M[IO_CURSOR], R1    ; da moldura de jogo e 
                MOV     M[IO_WRITE], R2     ; imprimimos o caracter +
                MOV     R1, R6
                PUSH    R7
                PUSH    R1                  ; Colocamos o cursor no 
                CALL    Memoria             ; Canto inferior direito
                MOV     M[IO_CURSOR], R1    ;  da moldura de jogo e 
                MOV     M[IO_WRITE], R2     ; imprimimos o caracter +
                POP     R7
                POP     R6
                POP     R5
                POP     R4
                POP     R3
                POP     R2
                POP     R1
                RET

;================================================================
; EscLinCol: Rotina que efectua a escrita de uma linha 
;            ou coluna da moldura
;               Entradas: Pilha - Inicio, Linha ou Coluna
;               Saidas: ---
;               Efeitos: Altera a memoria
;================================================================

EscLinCol:      PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                PUSH    R5
                MOV     R1, M[SP+8]         ;R1 - Inicio Linha/Coluna
                MOV     R4, M[SP+7]         ;R4 - Linha ou coluna
                CMP     R4, LINHA
                BR.NZ   EscCol
EscLin:         MOV     R2, MOLDURACB
                MOV     R4, 1               ;R4 - Soma para 
                ADD     R1, R4              ; posicao Seguinte
                BR      CicloELC
EscCol:         MOV     R2, MOLDURAED
                MOV     R4, LIN_SEG
                ADD     R1, R4
CicloELC:       MOV     M[IO_CURSOR], R1    ; O cursor e colocado 
                MOV     M[IO_WRITE], R2     ; na posicao seguinte 
                PUSH    GRAVAR              ; ao canto e a rotina
                PUSH    R1                  ; escreve um caracter por
                CALL    Memoria             ; linha/coluna ate chegar
                ADD     R1, R4              ; ao canto na outra ponta
                PUSH    VER
                PUSH    R1
                CALL    Memoria
                POP     R3
                CMP     R3, LIVRE
                BR.Z    CicloELC
                POP     R5
                POP     R4
                POP     R3
                POP     R2
                POP     R1
                RETN    2

;================================================================
; Moldura: Rotina que desenha a moldura de jogo
;               Entradas: ---
;               Saidas: ---
;               Efeitos: Altera a memoria
;================================================================

Moldura:        PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                PUSH    R5
                PUSH    R6
                CALL    PosCantos          ; Posicionamos os cantos
                MOV     R1, GRANDE         ; e pomos
                CMP     M[MOLDURAGP], R1
                JMP.Z   CantosG
                MOV     R1, PEQUENA
                CMP     M[MOLDURAGP], R1
                BR.Z    CantosP
                MOV     R1, CPEQUENA
                CMP     M[MOLDURAGP], R1
                BR.Z    CantosCP
CantosLP:       MOV     R3, CSE4
                MOV     R4, CSD4
                MOV     R5, CIE4
                MOV     R6, CID4
                BR      Escreve
CantosCP:       MOV     R3, CSE3
                MOV     R4, CSD3
                MOV     R5, CIE3
                MOV     R6, CID3
                BR      Escreve
CantosP:        MOV     R3, CSE2
                MOV     R4, CSD2
                MOV     R5, CIE2
                MOV     R6, CID2
                BR      Escreve
CantosG:        MOV     R3, CSE
                MOV     R4, CSD
                MOV     R5, CIE
                MOV     R6, CID
Escreve:        MOV     R1, LINHA
                PUSH    R3
                PUSH    R1
                CALL    EscLinCol           ; a linha de cima
                PUSH    R5
                PUSH    R1
                CALL    EscLinCol           ; a linha de baixo
                MOV     R1, COLUNA
                PUSH    R3
                PUSH    R1
                CALL    EscLinCol           ; a coluna esquerda
                PUSH    R4
                PUSH    R1
                CALL    EscLinCol           ; a coluna direita
                POP     R6
                POP     R5
                POP     R4
                POP     R3
                POP     R2
                POP     R1
                RET

;================================================================
; StrTron: Escreve TRON ao lado da moldura
;               Entradas: ---
;               Saidas: ---
;               Efeitos: ---
;================================================================

StrTron:        PUSH    R4
                PUSH    R5
                MOV     R4, XY_Tron1
                MOV     R5, Tron1
                CALL    Mensagem
                MOV     R4, XY_Tron2
                MOV     R5, Tron2
                CALL    Mensagem
                MOV     R4, XY_Tron3
                MOV     R5, Tron3
                CALL    Mensagem
                MOV     R4, XY_Tron4
                MOV     R5, Tron4
                CALL    Mensagem
                MOV     R4, XY_Tron5
                MOV     R5, Tron5
                CALL    Mensagem
                MOV     R4, XY_Tron6
                MOV     R5, Tron6
                CALL    Mensagem
                MOV     R4, XY_Tron7
                MOV     R5, Tron7
                CALL    Mensagem
                MOV     R4, XY_Tron8
                MOV     R5, Tron8
                CALL    Mensagem
                MOV     R4, XY_Tron9
                MOV     R5, Tron9
                CALL    Mensagem
                MOV     R4, XY_Tron10
                MOV     R5, Tron10
                CALL    Mensagem
                MOV     R4, XY_Tron11
                MOV     R5, Tron11
                CALL    Mensagem
                MOV     R4, XY_Tron12
                MOV     R5, Tron12
                CALL    Mensagem
                MOV     R4, XY_Tron13
                MOV     R5, Tron13
                CALL    Mensagem
                MOV     R4, XY_Tron14
                MOV     R5, Tron14
                CALL    Mensagem
                MOV     R4, XY_Tron15
                MOV     R5, Tron15
                CALL    Mensagem
                MOV     R4, XY_Tron16
                MOV     R5, Tron16
                CALL    Mensagem
                MOV     R4, XY_Tron17
                MOV     R5, Tron17
                CALL    Mensagem
                MOV     R4, XY_Tron18
                MOV     R5, Tron18
                CALL    Mensagem
                MOV     R4, XY_Tron19
                MOV     R5, Tron19
                CALL    Mensagem
                MOV     R4, XY_Tron20
                MOV     R5, Tron20
                CALL    Mensagem
                POP     R5
                POP     R4
                RET

;================================================================
; Jogadores: Rotina que coloca os 2 jogadores na 
;            posicao inicial
;               Entradas: ---
;               Saidas: ---
;               Efeitos: Altera POS1 e POS2
;================================================================

Jogadores:      PUSH    R1
                PUSH    R2
                PUSH    R3
                MOV     R1, PLAYER1
                MOV     R2, P1_INIC
                MOV     M[IO_CURSOR], R2    ; Posicionamos o cursor 
                MOV     M[IO_WRITE], R1     ; na posicao inicial do 
                MOV     M[POS1], R2         ; jogador 1 e escrevemos
                PUSH    GRAVAR              ; o caracter 'X'
                PUSH    R2
                CALL    Memoria
                MOV     R1, PLAYER2
                MOV     R2, P2_INIC
                MOV     M[IO_CURSOR], R2    ; Posicionamos o cursor
                MOV     M[IO_WRITE], R1     ; na posicao inicial do
                MOV     M[POS2], R2         ; jogador 2 e escrevemos
                PUSH    GRAVAR              ; o caracter '#'
                PUSH    R2
                CALL    Memoria
                POP     R3
                POP     R2
                POP     R1
                RET

;================================================================
; Esc_LCD: Escreve no LCD o constante ao longo do jogo
;               Entradas: ---
;               Saidas: ---
;               Efeitos: ---
;================================================================

Esc_LCD:        PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                MOV     R1, 8015h
                MOV     M[LCD_CONTROL], R1
                MOV     R2, ASCII
                ADD     R2, M[PONTOS1]
                MOV     M[LCD_WRITE], R2
                MOV     R1, 801Fh
                MOV     M[LCD_CONTROL], R1
                MOV     R2, ASCII
                ADD     R2, M[PONTOS2]
                MOV     M[LCD_WRITE], R2
                MOV     R4, 8000h
                MOV     M[LCD_CONTROL], R4
                MOV     R1, LCD_1
                MOV     R2, LCD_CONTROL
Cic_LCD:        MOV     R3, M[R1]
                CMP     R3, FIM_TEXTO
                BR.Z    Cic_LCD2
                MOV     M[LCD_WRITE], R3
                INC     R4
                MOV     M[LCD_CONTROL], R4
                INC     R1
                BR      Cic_LCD
Cic_LCD2:       MOV     R1, LCD_2
                MOV     R2, 800Fh
                MOV     M[LCD_CONTROL], R2
                MOV     R3, M[R1]
                MOV     M[LCD_WRITE], R3
                MOV     R1, LCD_3
                MOV     R2, 8010h
Cic_LCD3:       MOV     M[LCD_CONTROL], R2
                MOV     R3, M[R1]
                MOV     M[LCD_WRITE], R3
                INC     R1
                INC     R2
                MOV     R3, M[R1]
                CMP     R3, FIM_TEXTO
                BR.NZ   Cic_LCD3
                MOV     R1, LCD_4
                MOV     R2, 801Ah
Cic_LCD4:       MOV     M[LCD_CONTROL], R2
                MOV     R3, M[R1]
                MOV     M[LCD_WRITE], R3
                INC     R1
                INC     R2
                MOV     R3, M[R1]
                CMP     R3, FIM_TEXTO
                BR.NZ   Cic_LCD4
                POP     R4
                POP     R3
                POP     R2
                POP     R1
                RET

;================================================================
; Esc_LCD_Var: Rotina que escreve no LCD a pontuacao
;               Entradas: ---
;               Saidas: ---
;               Efeitos: Escreve as variaveis no LCD
;================================================================


Esc_LCD_Var:    PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                MOV     R1, 8015h
                MOV     M[LCD_CONTROL], R1
                MOV     R2, ASCII
                ADD     R2, M[PONTOS1]
                CMP     R2, ASCII10
                JMP.Z   TDecimal1
                MOV     M[LCD_WRITE], R2
Volta1:         MOV     R1, 801Fh
                MOV     M[LCD_CONTROL], R1
                MOV     R2, ASCII
                ADD     R2, M[PONTOS2]
                CMP     R2, ASCII10
                JMP.Z   TDecimal2
                MOV     M[LCD_WRITE], R2
Volta2:         POP     R4
                POP     R3
                POP     R2
                POP     R1
                RET
TDecimal1:      MOV     R3, M[LCD_DEC1]
                INC     R3
                DEC     R1
                MOV     M[LCD_CONTROL], R1
                MOV     M[LCD_DEC1], R3
                MOV     M[LCD_WRITE], R3
                MOV     M[PONTOS1], R0
                MOV     R3, 8015h
                MOV     M[LCD_CONTROL], R3
                MOV     R3, ASCII
                MOV     M[LCD_WRITE], R3
                JMP     Volta1
TDecimal2:      MOV     R4, M[LCD_DEC2]
                INC     R3
                DEC     R1
                MOV     M[LCD_CONTROL], R1
                MOV     M[LCD_DEC2], R4
                MOV     M[LCD_WRITE], R4
                MOV     M[PONTOS2], R0
                MOV     R4, 801Fh
                MOV     M[LCD_CONTROL], R4
                MOV     R4, ASCII
                MOV     M[LCD_WRITE], R4
                JMP     Volta2

;================================================================
; Esc_LCD_Max: Rotina que escreve no LCD o tempo 
;              máximo de jogo.
;               Entradas: ---
;               Saidas: ---
;               Efeitos: Escreve no lcd o tempo máximo 
;                        de jogo obtido.
;================================================================


Esc_LCD_Max:    PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                MOV     R4, M[TMAXDEC]
                MOV     R2, NUM_NIBBLES
                MOV     R3, 800Eh
CicEscMax1:     MOV     M[LCD_CONTROL], R3
                MOV     R1, R4
                AND     R1, NIBBLE_MASK
                CMP     R1, 000ah
                BR.Z    IgnA
                ADD     R1, ASCII
                MOV     M[LCD_WRITE], R1
                ROR     R4, BITS_PER_NIBBLE
CicEscMax2:     DEC     R3
                DEC     R2
                BR.NZ   CicEscMax1
                MOV     M[TMAXDEC], R4
                POP     R4
                POP     R3
                POP     R2
                POP     R1
                RET
IgnA:           MOV     R1, ASCII
                MOV     M[LCD_CONTROL],R3       ;Transforma a con-
                MOV     M[LCD_WRITE], R1        ;tagem dos segundos
                MOV     R1, FFF0h               ;em base decimal
                AND     R4, R1
                ROR     R4, BITS_PER_NIBBLE
                MOV     R1, 1
                ADD     R4, R1
                BR      CicEscMax2

;================================================================
; NextCar: Rotina que efectua a escrita do caracter 
;          seguinte dos jogadores
;               Entradas: Pilha - Jogador, 
;                         Posicao proxima particula
;               Saidas: ---
;               Efeitos: Altera POS1, POS2, COL1 e COL2
;================================================================

NextCar:        PUSH    R1
                PUSH    R2
                PUSH    R3
                PUSH    R4
                PUSH    R5
                PUSH    R6
                PUSH    R7
                MOV     R1, M[SP+10]
                MOV     R2, M[SP+9]
                CMP     R1, PLAYER1
                BR.NZ   NextCarP2
NextCarP1:      MOV     R3, POS1
                MOV     M[ULT_MOV1], R2
                BR      PosNextCar
NextCarP2:      MOV     R3, POS2
                MOV     M[ULT_MOV2], R2
PosNextCar:     CMP     R2, BAIXO
                BR.NZ   TryPosNCC
                MOV     R4, LIN_SEG
                BR      CicNextCar
TryPosNCC:      CMP     R2, CIMA
                BR.NZ   TryPosNCE
                MOV     R4, LIN_ANT
                BR      CicNextCar
TryPosNCE:      CMP     R2, ESQUERDA
                BR.NZ   TryPosNCD
                MOV     R4, -1
                BR      CicNextCar
TryPosNCD:      MOV     R4, 1
CicNextCar:     ADD     M[R3], R4
                MOV     R5, M[R3]
                PUSH    VER
                PUSH    R5
                CALL    Memoria
                POP     R7
                CMP     R7, OCUPADO
                BR.Z    Abortar
                MOV     M[IO_CURSOR], R5
                MOV     M[IO_WRITE], R1
                PUSH    GRAVAR
                PUSH    R5
                CALL    Memoria
                BR      FimNextCar
Abortar:        CMP     R1, PLAYER1
                BR.NZ   AbortarP2
AbortarP1:      MOV     R2, OCUPADO
                MOV     M[COL1], R2
                INC     M[PONTOS2]
                BR      FimNextCar
AbortarP2:      MOV     R2, OCUPADO
                MOV     M[COL2], R2
                INC     M[PONTOS1]
                PUSH    PLAYER1
                CALL    NextMov
                CMP     M[COL1], R0
                BR.Z    FimNextCar
                DEC     M[PONTOS1]
                DEC     M[PONTOS2]
FimNextCar:     POP     R7
                POP     R6
                POP     R5
                POP     R4
                POP     R3
                POP     R2
                POP     R1
                RETN    2


;================================================================
; LeftBut:      Rotina que escolhe o proximo movimento caso
;   LeftBut ou I7 tenha sido pressionado
;               Entradas: Pilha - PLAYER1 ou PLAYER2
;               Saidas: ---
;               Efeitos: ---
;================================================================

LeftBut:             PUSH    R1
                PUSH    R2
                PUSH    R3
                MOV     R2, M[SP+5]
                CMP     R2, PLAYER1
                BR.NZ   LeftButP2
LeftButP1:      MOV     R3, ULT_MOV1
                BR      TentaLeftButE
LeftButP2:      MOV     R3, ULT_MOV2
TentaLeftButE:  MOV    R1, ESQUERDA
                CMP     M[R3], R1           ; Caso o ultimo movimento
                BR.NZ   TentaLeftButD       ; de P1 tenha sido para 
                PUSH    R2                  ; a esqurda, a particula
                PUSH    BAIXO               ; seguinte e na linha 
                CALL    NextCar             ; de baixo
                POP     R3
                POP     R2
                POP     R1
                RETN    1
TentaLeftButD:  MOV     R1, DIREITA
                CMP     M[R3], R1           ; se foi para a direita,
                BR.NZ   TentaLeftButC       ; a particula seguinte e
                PUSH    R2                  ; na linha de cima
                PUSH    CIMA
                CALL    NextCar
                POP     R3
                POP     R2
                POP     R1
                RETN    1
TentaLeftButC:  MOV     R1, CIMA            ; se foi para cima
                CMP     M[R3], R1           ; a particula seguinte
                BR.NZ   TentaLeftButB       ; e na coluna da esquerda
                PUSH    R2
                PUSH    ESQUERDA
                CALL    NextCar
                POP     R3
                POP     R2
                POP     R1
                RETN    1
TentaLeftButB:  PUSH    R2                  ; se foi para baixo
                PUSH    DIREITA             ; a particula seguinte e
                CALL    NextCar             ; na coluna da direita
                POP     R3
                POP     R2
                POP     R1
                RETN    1


;================================================================
; RightBut:     Rotina que escolhe o proximo movimento caso
;   I9 ou RightBut tenha sido pressionado
;               Entradas: Pilha - PLAYER1 ou PLAYER2
;               Saidas: ---
;               Efeitos: ---
;================================================================

RightBut:       PUSH    R1
                PUSH    R2
                PUSH    R3
                MOV     R2, M[SP+5]
                CMP     R2, PLAYER1
                BR.NZ   RightButP2
RightButP1:     MOV     R3, ULT_MOV1
                BR      TentaRightButE
RightButP2:     MOV     R3, ULT_MOV2
TentaRightButE: MOV     R1, ESQUERDA
                CMP     M[R3], R1           ; Caso o ultimo movimento
                BR.NZ   TentaRightButD      ; de P1 tenha sido para a
                PUSH    R2                  ; esqurda, a particula 
                PUSH    CIMA                ; seguinte e na linha 
                CALL    NextCar             ; de cima
                POP     R3
                POP     R2
                POP     R1
                RETN    1
TentaRightButD: MOV     R1, DIREITA
                CMP     M[R3], R1           ; se foi para a direita,
                BR.NZ   TentaRightButC      ; a particula seguinte e
                PUSH    R2                  ; na linha de baixo
                PUSH    BAIXO
                CALL    NextCar
                POP     R3
                POP     R2
                POP     R1
                RETN    1
TentaRightButC: MOV     R1, CIMA            ; se foi para cima
                CMP     M[R3], R1           ; a particula seguinte
                BR.NZ   TentaRightButB      ; e na coluna da direita
                PUSH    R2
                PUSH    DIREITA
                CALL    NextCar
                POP     R3
                POP     R2
                POP     R1
                RETN    1
TentaRightButB: PUSH    R2
                PUSH    ESQUERDA            ; se foi para baixo
                CALL    NextCar             ; a particula seguinte e
                POP     R3                  ; na coluna da esquerda
                POP     R2
                POP     R1
                RETN    1


;================================================================
; NoBut:    Rotina que escolhe o proximo movimento caso
;   nenhum interruptor tenha sido pressionado
;               Entradas: Pilha - PLAYER1 ou PLAYER2
;               Saidas: ---
;               Efeitos: ---
;================================================================

NoBut:          PUSH    R1
                PUSH    R2
                MOV     R1, M[SP+4]
                CMP     R1, PLAYER1
                BR.NZ   P2_Frente
                MOV     R2, ULT_MOV1
                BR      Frente
P2_Frente:      MOV     R2, ULT_MOV2
Frente:         PUSH    R1
                PUSH    M[R2]
                CALL    NextCar
                POP     R2
                POP     R1
                RETN    1


;================================================================
; NextMov:      Rotina que escolhe o proximo movimento de P1
;               Entradas: Pilha - PLAYER1 ou PLAYER2
;               Saidas: ---
;               Efeitos: ---
;================================================================

NextMov:        PUSH    R1
                PUSH    R2
                PUSH    R3
                MOV     R2, M[SP+5]
                CMP     R2, PLAYER1
                BR.NZ   P2_Next
                MOV     R3, INT_P1
                BR      Next
P2_Next:        MOV     R3, INT_P2
Next:           MOV     R1, ESQUERDA        ; Se o interruptor
                CMP     M[R3], R1           ; esquerda tiver sido
                BR.NZ   Int_Dir1            ; seleccionado a rotina
                PUSH    R2                  ; LeftBut decide o 
                CALL    LeftBut             ; proximo movimento
                JMP     P1_Avancado
Int_Dir1:       MOV     R1, DIREITA         ; Se o interruptor 
                CMP     M[R3], R1           ; direita tiver sido 
                BR.NZ   Continua1           ; seleccionado a rotina
                PUSH    R2                  ; RightBut decide o 
                CALL    RightBut            ; proximo movimento
                BR      P1_Avancado
Continua1:      PUSH    R2                  ; Caso contrario
                CALL    NoBut               ; a rotina NoBut decide
P1_Avancado:    MOV     M[R3], R0           ; O valor do interruptor
                POP     R3                  ; e posto a 0
                POP     R2
                POP     R1
                RETN    1


;================================================================
; Jogo:         Rotina de jogo
;               Entradas: ---
;               Saidas: ---
;               Efeitos: ---
;================================================================
Jogo:           PUSH    PLAYER1
                CALL    NextMov
                PUSH    PLAYER2
                CALL    NextMov
                CALL    Esc_LCD_Var
FimRotJogo:     RET

;================================================================
; Reenicia_timer: Rotina que inicia o temporizador
;               Entradas: DELAY
;               Saidas: ---
;               Efeitos: Inicia o temporizador
;================================================================
Reenicia_timer: PUSH	R1
                MOV 	R1, DELAY
                MOV 	M[TIMER_VALUE], R1
                MOV		R1, 1b
                MOV 	M[TIMER_CONTROL], R1
                POP		R1
                RET


;================================================================
; EscCont:      Rotina que escreve no Display os segundos 
;               que ja passaram
;               Entradas: CONTADOR
;               Saidas: ---
;               Efeitos: Altera CONTADOR
;================================================================
EscCont:        PUSH    R1
                PUSH    R2
                PUSH    R3
                MOV     R2, NUM_NIBBLES
                MOV     R3, IO_DISPLAY
CicEscContP1:   MOV     R1, M[CONTADOR]
                AND     R1, NIBBLE_MASK
                CMP     R1, 000ah
                BR.Z    IgnoraA
                MOV     M[R3], R1
                ROR     M[CONTADOR], BITS_PER_NIBBLE
CicEscContP2:   INC     R3
                DEC     R2
                BR.NZ   CicEscContP1
                POP     R3
                POP     R2
                POP     R1
                RET
IgnoraA:        MOV     R1, R0              ;Transforma a contagem
                MOV     M[R3], R1           ;dos segundos em base
                MOV     R1, FFF0h           ;decimal
                AND     M[CONTADOR], R1
                ROR     M[CONTADOR], BITS_PER_NIBBLE
                MOV     R1, 1
                ADD     M[CONTADOR], R1
                BR      CicEscContP2


;================================================================
; NIVELRot:     Rotina que decide o NIVEL de Jogo
;               Entradas: TTOTAL
;               Saidas: ---
;               Efeitos: Altera NIVEL
;================================================================
NIVELRot:       MOV     R1, 100d
                CMP     R1, M[TTOTAL]
                JMP.Z   NIVEL2
                MOV     R1, 200d
                CMP     R1, M[TTOTAL]
                JMP.Z   NIVEL3
                MOV     R1, 400d
                CMP     R1, M[TTOTAL]
                JMP.Z   NIVEL4
                MOV     R1, 600d
                CMP     R1, M[TTOTAL]
                JMP.Z   NIVEL5
                RET
NIVEL2:         MOV     R1, 5                   ;Defenição da 
                MOV     M[NIVEL], R1            ;variavel NIVEL e 
                MOV     R1, 000fh               ;dos leds de acordo
                MOV     M[LED_DISPLAY], R1      ;com o NIVEL
                RET
NIVEL3:         MOV     R1, 3
                MOV     M[NIVEL], R1
                MOV     R1, 00ffh
                MOV     M[LED_DISPLAY], R1
                RET
NIVEL4:         MOV     R1, 2
                MOV     M[NIVEL], R1
                MOV     R1, 0fffh
                MOV     M[LED_DISPLAY], R1
                RET
NIVEL5:         MOV     R1, 1
                MOV     M[NIVEL], R1
                MOV     R1, ffffh
                MOV     M[LED_DISPLAY], R1
                RET


;================================================================
; Delay_Ciclo:  Rotina que controla os Delays do ciclo de jogo
;               Entradas:
;               Saidas: ---
;               Efeitos: Altera NIVEL
;================================================================

Delay_Ciclo:    PUSH    R2
                PUSH    R1
InicDelCic:     MOV     R2, M[CONTAGEM]         ;Variavel de 
                MOV     R1, M[TTOTAL]           ;contagem que tem
                SUB     R1, R2                  ;guardado o tempo em
                CMP     R1, M[NIVEL]            ;que sedeu a ultima 
                BR.NZ   Semi_Ciclo              ;escrita de carateres
Pausa:          MOV     R1, M[INT_READ]
                TEST    R1, 0080h
                BR.NZ   Pausa
                MOV     R1, M[TTOTAL]
                MOV     M[CONTAGEM], R1
                CALL    Jogo
                MOV     R1, M[COL1]
                CMP     R1, OCUPADO
                BR.Z    RetCC
                MOV     R1, M[COL2]
                CMP     R1, OCUPADO
                BR.Z    RetCC
Semi_Ciclo:     MOV     R1, M[TTOTAL]           ; Ciclo que só ocorre
                SUB     R1, M[C10]              ; de 10 em 10 decimos
                CMP     R1, SEGUNDO             ; de segundo, permi-
                BR.NZ   RetCC                   ; tindo a contagem de
                CALL    EscCont                 ; segundo a segundo
                INC     M[CONTADOR]
                MOV     R1, M[CONTADOR]
                DEC     R1
                CMP     M[TMAXDEC], R1
                BR.P    NIncMax
                MOV     M[TMAXDEC], R1
                CALL    Esc_LCD_Max
 NIncMax:       MOV     R1, M[TTOTAL]
                MOV     M[C10], R1
RetCC:          POP     R1
                POP     R2
                RET

;================================================================
; Colisao1:     Faz uma explosao quando ha colisao
;               Entradas: EXP
;               Saidas: ---
;               Efeitos: ---
;================================================================
Colisao1:       MOV     R1, M[EXP]
                MOV     M[IO_CURSOR], R1
                MOV     R2, EXPLOSAO1
                MOV     M[IO_WRITE], R2
                MOV     R4, R0
Cic:            CMP     M[VAR_TIMER], R0
                BR.NZ   Cic
                INC     R4
                MOV     R1, 0001h
                MOV     M[VAR_TIMER], R1
                CMP     R4, 0006h
                BR.NZ   Cic
                MOV     R1, M[EXP]
                MOV     R4,R1
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                INC     R4
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                DEC     R4
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                ADD     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                SUB     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                DEC     R4
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO2
                MOV     M[IO_WRITE], R2
                MOV     R4, R0
Cic2:           CMP     M[VAR_TIMER], R0
                BR.NZ   Cic2
                INC     R4
                MOV     R1, 0001h
                MOV     M[VAR_TIMER], R1
                CMP     R4, 0006h
                BR.NZ   Cic2
                MOV     R1, M[EXP]
                MOV     R4,R1
                ADD     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R1, M[EXP]
                MOV     R4,R1
                ADD     R4, 0002h
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0002h
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                SUB     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                ADD     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R1, M[EXP]
                MOV     R4,R1
                ADD     R4, 0002h
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0002h
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                SUB     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                ADD     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                ADD     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, 0004h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0004h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                SUB     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO3
                MOV     M[IO_WRITE], R2
                MOV     R1, M[EXP]
                MOV     M[IO_CURSOR], R1
                MOV     R2, EXPLOSAO5
                MOV     M[IO_WRITE], R2
                ENI
                MOV     R4, R0
Cic3:           CMP     M[VAR_TIMER], R0
                BR.NZ   Cic3
                INC     R4
                MOV     R1, 0001h
                MOV     M[VAR_TIMER], R1
                CMP     R4, 0006h
                BR.NZ   Cic3
                MOV     R1, M[EXP]
                MOV     R4,R1
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                INC     R4
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                DEC     R4
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                ADD     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                SUB     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                DEC     R4
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R0
Cic4:           CMP     M[VAR_TIMER], R0
                BR.NZ   Cic4
                INC     R4
                MOV     R1, 0001h
                MOV     M[VAR_TIMER], R1
                CMP     R4, 0006h
                BR.NZ   Cic4
                MOV     R1, M[EXP]
                MOV     R4,R1
                ADD     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R1, M[EXP]
                MOV     R4,R1
                ADD     R4, 0002h
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0002h
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                SUB     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                ADD     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R1, M[EXP]
                MOV     R4,R1
                ADD     R4, 0002h
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0002h
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                SUB     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                ADD     R4, 0002h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                DEC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                INC     R4
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                ADD     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, 0004h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, 0004h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                SUB     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                ADD     R4, LIN_SEG
                ADD     R4, 0003h
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R1
                SUB     R4, LIN_SEG
                SUB     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4,R1
                ADD     R4, LIN_SEG
                ADD     R4, LIN_SEG
                MOV     M[IO_CURSOR], R4
                MOV     R2, EXPLOSAO4
                MOV     M[IO_WRITE], R2
                MOV     R4, R0
 Cic5:          CMP     M[VAR_TIMER], R0
                BR.NZ   Cic5
                INC     R4
                MOV     R1, 0001h
                MOV     M[VAR_TIMER], R1
                CMP     R4, 0006h
                BR.NZ   Cic5
                RET


;================================================================
; ReeniciaJogo: Trata do fim do jogo e de reenicializar todas
;               as variaveis para um novo jogo
;               Entradas: ---
;               Saidas: ---
;               Efeitos: Reenicializa as Variaveis
;================================================================

ReeniciaJogo:   CALL    LimpaJanela
                CALL    ApagaMem
                CALL    MsgFinal
                MOV     M[TTOTAL],R0
                MOV     R1, 1
                MOV     M[CONTADOR], R1
                MOV     M[C10], R0
                MOV     R1, 7
                MOV     M[NIVEL],R1
                MOV     M[CONTAGEM], R0
                MOV     M[ULT_MOV1], R0
                MOV     M[ULT_MOV2], R0
                MOV     M[LED_DISPLAY], R0
                MOV     M[COL1], R0
                MOV     M[COL2], R0
                MOV     M[VAR_TIMER],R0
                MOV     M[EXP],R0
                MOV     M[INT_P1],R0
                MOV     M[INT_P2],R0
                MOV     M[INT_I1],R0
                MOV     M[POS1],R0
                MOV     M[POS2],R0
                MOV     M[COLIDIU],R0
                MOV     M[MOLDURAGP],R0
                MOV     R1, 'D'
                MOV     M[ULT_MOV1], R1
                MOV     R1, 'E'
                MOV     M[ULT_MOV2], R1
                CALL    ApagaMem
                RET


;################################################################
;# Programa Principal:                                          #
;################################################################

Inicio:         MOV     R1, 'D'
                MOV     M[ULT_MOV1], R1
                MOV     R1, 'E'
                MOV     M[ULT_MOV2], R1
                MOV     R1, SP_INICIAL
                MOV     SP, R1
                MOV     R1, INT_MASK
                MOV     M[INT_MASK_ADDR], R1
                MOV     R1, FFFFh
                MOV     M[IO_CURSOR], R1
                CALL    ApagaMem                
                ENI

CicloJogo:      CALL    MsgInicial
                CALL    Moldura
                CALL    StrTron
                CALL    Esc_LCD
                CALL    Esc_LCD_Max
                CALL    Jogadores
                CALL    Reenicia_timer

CicloPrincipal: CMP     M[VAR_TIMER], R0
                BR.NZ   CicloPrincipal
                MOV     R1, 1
                MOV     M[VAR_TIMER], R1
                INC     M[TTOTAL]
                CALL    NIVELRot
                CALL    Delay_Ciclo
                MOV     R1, M[COL1]
                CMP     R1, OCUPADO
                BR.Z    Fim
                MOV     R1, M[COL2]
                CMP     R1, OCUPADO
                BR.Z    Fim
                BR      CicloPrincipal

Fim:            MOV     R5, M[POS1]
                MOV     M[EXP], R5
                CMP     M[COL1], R0
                CALL.NZ Colisao1
                MOV     R5, M[POS2]
                MOV     M[EXP], R5
                CMP     M[COL2], R0
                CALL.NZ Colisao1
                CALL    ReeniciaJogo
                JMP     CicloJogo
