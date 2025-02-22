; Calcula o fatorial de um número armazenado em 0x100 e armazena o resultado em 0x102

    ORG 0x000       ; Define o início do código na posição 0x000

START:
    LD N            ; Carrega o valor de N no AC
    SC SUBR         ; Chama a sub-rotina para calcular o fatorial
    HM              ; Para a máquina

    ORG 0x100       ; Define o início dos dados na posição 0x100

N:      DW 5        ; Armazena o número para calcular o fatorial (por exemplo, 5)
RES:    DW 0        ; Armazena o resultado do fatorial

    ORG 0x200       ; Define o início da sub-rotina na posição 0x200

SUBR:   K /0000     ; Início da sub-rotina
        JZ ZERO     ; Se N for 0, pula para ZERO (fatorial de 0 é 1)
        MM i        ; Armazena o valor de N em i
        MM RES      ; Inicializa RES com N
LOOP:   LD i        ; Carrega o valor de i no AC
        SB UM       ; Subtrai 1 de i
        MM i        ; Armazena o novo valor de i
        JZ ENDSUBR  ; Se i for 0, pula para ENDSUBR
        ML RES      ; Multiplica RES pelo valor de i
        MM RES      ; Armazena o resultado em RES
        JP LOOP     ; Repete o loop
ZERO:   LV =1       ; Carrega 1 no AC (fatorial de 0 é 1)
        MM RES      ; Armazena 1 em RES
ENDSUBR RS SUBR     ; Retorna da sub-rotina

    ORG 0x300       ; Define o início das constantes na posição 0x300

UM:     DW 1        ; Constante 1
i:      DW 0        ; Variável temporária para armazenar o valor atual de N

    END             ; Fim do programa
