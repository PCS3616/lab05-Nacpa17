; fatorial.asm
; Calcula o fatorial de um número armazenado em 0x100 e armazena o resultado em 0x102

    ORG 0x100       ; Define o início do programa na posição 0x100

N:      DW 5        ; Armazena o número para calcular o fatorial (por exemplo, 5)
RES:    DW 0        ; Armazena o resultado do fatorial

    ORG 0x000       ; Define o início do código na posição 0x000

START:
    LV N            ; Carrega o valor de N no AC
    LD              ; Carrega o valor de N no AC
    JZ FIM          ; Se N for 0, pula para FIM (fatorial de 0 é 1)
    MM TEMP         ; Armazena o valor de N em TEMP
    LV 1            ; Carrega 1 no AC
    MM RES          ; Inicializa RES com 1

LOOP:
    LD TEMP         ; Carrega o valor de TEMP no AC
    JZ FIM          ; Se TEMP for 0, pula para FIM
    ML RES          ; Multiplica RES pelo valor de TEMP
    MM RES          ; Armazena o resultado em RES
    SB 1            ; Subtrai 1 de TEMP
    MM TEMP         ; Armazena o novo valor de TEMP
    JP LOOP         ; Repete o loop

FIM:
    LV 1            ; Carrega 1 no AC (fatorial de 0 é 1)
    MM RES          ; Armazena 1 em RES
    HM              ; Para a máquina

TEMP:   DW 0        ; Variável temporária para armazenar o valor atual de N

    END
