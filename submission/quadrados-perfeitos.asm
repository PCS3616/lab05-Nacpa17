; Programa principal
@ /0000
SC /0010    ; Chama a sub-rotina para calcular quadrados perfeitos
HM /009A    ; Finaliza

; Sub-rotina para calcular quadrados perfeitos
@ /0010
LD /0100    ; Inicializa acumulador com 0
MM /0102    ; Armazena primeiro quadrado (0² = 0)
LD /0104    ; Carrega a constante 1
MM /0106    ; Configura incremento inicial (2n + 1)
LD /0108    ; Inicializa contador de N
MM /010A    ; Armazena contador

LOOP
LD /0102    ; Carrega último quadrado salvo
AD /0106    ; Soma incremento (2n + 1)
MM /0102    ; Armazena novo quadrado
LD /0106    ; Carrega incremento atual
AD /0104    ; Soma 2 para preparar próximo incremento
MM /0106    ; Atualiza incremento
LD /010A    ; Carrega contador
AD /0104    ; Incrementa contador (n+1)
MM /010A    ; Atualiza contador
SB /008A    ; Compara com limite (64)
JZ /0050    ; Se chegou ao fim, sai do loop
JP /0010    ; Continua o loop

@ /0050
RS /0010    ; Retorna da sub-rotina

; Variáveis e constantes
@ /0100
K /0000  ; Primeiro quadrado (0)
@ /0102
K /0000  ; Resultado armazenado dos quadrados perfeitos
@ /0104
K /0001  ; Constante para incremento de 2
@ /0106
K /0001  ; Incremento inicial (2n+1)
@ /0108
K /0000  ; Contador de n
@ /010A
K /0000  ; Armazena contador
@ /008A
K /0040  ; Limite máximo (64)
