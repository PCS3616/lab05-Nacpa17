@ /000
INICIO LD VALOR ; Carrega o valor de VALOR
SC CALC_FAT ; Chama a sub-rotina CALC_FAT
HM /000 ; Halt (termina o programa)

@ /100
VALOR K /0005 ; Número para calcular o fatorial (exemplo: 5)
RESULT K /0000 ; Variável para armazenar o resultado

@ /200
CALC_FAT K /0000 ; Sub-rotina para calcular o fatorial
JZ CASO_ZERO ; Se VALOR for 0, pula para CASO_ZERO
LD VALOR ; Carrega VALOR
MM AUX ; Armazena VALOR em AUX
LD RESULT ; Carrega RESULT (inicialmente 0)
AD UM ; Adiciona 1 (inicializa RESULT com 1)
MM RESULT ; Armazena o resultado em RESULT

REPETIR LD AUX ; Carrega AUX
SB UM ; Subtrai 1 de AUX
JZ FIM ; Se AUX for 0, termina a sub-rotina
MM AUX ; Armazena o novo valor de AUX
LD RESULT ; Carrega RESULT
ML AUX ; Multiplica RESULT por AUX
MM RESULT ; Armazena o resultado em RESULT
JP REPETIR ; Repete o loop

CASO_ZERO LD UM ; Caso especial: fatorial de 0 é 1
MM RESULT ; Armazena 1 em RESULT

FIM RS CALC_FAT ; Retorna da sub-rotina

@ /300
UM K /0001 ; Constante 1
AUX K /0000 ; Variável auxiliar
