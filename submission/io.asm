@ /000 ; Início do programa

; Leitura dos valores de entrada
GD /000 ; Obtém um valor da entrada e armazena em X_D1
SB CONST ; Subtrai a constante de normalização
MM X_D1 ; Armazena o resultado em X_D1

GD /000 ; Obtém outro valor da entrada e armazena em Y_D1
SB CONST ; Subtrai a constante de normalização
MM SUM ; Armazena o resultado na variável SUM

LD /00B ; Carrega um valor auxiliar
SB SUPA ; Subtrai SUPA
JN CONTIN ; Se negativo, pula para CONTIN

LD SUM ; Carrega SUM
SB NORMA ; Subtrai NORMA
AD VAL ; Adiciona VAL
MM SUM ; Armazena o resultado em SUM
JP CONTIN ; Pula para CONTIN

@ /300 ; Endereço para continuação do programa

CONTIN LD SUM ; Carrega SUM
AD CONST ; Adiciona a constante de normalização
PD /100 ; Envia o resultado para a saída
HM /000 ; Finaliza o programa

@ /F00 ; Endereço para definição de variáveis

X_D1 K =0 ; Variável X_D1 inicializada com 0
X_D2 K =0 ; Variável X_D2 inicializada com 0
Y_D1 K =0 ; Variável Y_D1 inicializada com 0
Y_D2 K =0 ; Variável Y_D2 inicializada com 0
CONST K /3030 ; Constante de normalização
SUM K /0 ; Variável SUM inicializada com 0
SUPA K /0A00 ; Variável SUPA inicializada com valor fixo
NORMA K /00A0 ; Variável NORMA inicializada com valor fixo
VAL K /0100 ; Variável VAL inicializada com valor fixo