@ /000 ; Endereço inicial do programa

START LD N ; Carrega o valor de N no acumulador
SC SUBR ; Chama a sub-rotina SUBR
HM =0 ; Finaliza a execução do programa

; Definição de variáveis
@ /100 ; Endereço base para variáveis
N K /0000 ; Variável N (entrada)
RES K /0000 ; Variável RES (resultado)

; Sub-rotina para cálculo do fatorial
@ /200 ; Início da sub-rotina

SUBR K /0000 ; Inicializa SUBR
JZ ZERO ; Se o valor for zero, pula para ZERO
MM 1 ; Armazena 1 temporariamente em memória
MM RES ; Inicializa RES com 1

LOOP LD 1 ; Carrega o valor de 1 no acumulador
SB UM ; Subtrai UM do acumulador
MM 1 ; Armazena o novo valor de volta em 1
JZ ENDSUBR ; Se 1 for zero, finaliza a sub-rotina
M RES ; Multiplica o acumulador pelo RES
MM RES ; Armazena o novo valor de RES
JP LOOP ; Volta para LOOP para continuar o cálculo

ZERO LV -1 ; Define o valor de RES como 1 para 0! = 1
MM RES ; Armazena o valor em RES

ENDSUBR RS SUBR ; Retorna da sub-rotina

; Definição de constantes
@ /390
UM K =1 ; Constante UM = 1
1 K =0 ; Inicialização do registrador auxiliar