; Programa principal
@ /0000
SC /0100    ; Chama a sub-rotina para calcular quadrados perfeitos
HM /009A    ; Finaliza

; Sub-rotina para calcular quadrados perfeitos
@ /0100
LD ZERO     ; Inicializa acumulador com 0
MM RESULT   ; Armazena primeiro quadrado (0² = 0)
LD ONE      ; Carrega constante 1
MM INCREMENT ; Configura incremento inicial (2n + 1)
LD ZERO     ; Inicializa índice
MM COUNTER  ; Armazena índice
LD ZERO     ; Inicializa número atual
MM NUMBER   ; Armazena contador

CALC_SQUARES
LD COUNTER  ; Carrega índice atual
ML TWO      ; Multiplica por 2
AD ONE      ; Adiciona 1 (2i + 1)
AD RESULT   ; Soma ao resultado anterior
MM RESULT   ; Atualiza resultado
SAVE MM MEMORY_ADDR  ; Armazena resultado na memória

LD SAVE     ; Atualiza endereço de memória
AD TWO      ; Avança para próximo local de armazenamento
MM SAVE

LD COUNTER  ; Incrementa índice
AD ONE      
MM COUNTER

LD NUMBER   ; Incrementa número atual
AD ONE
MM NUMBER
SB MAX_COUNT ; Verifica se atingiu o limite (63)
JN CALC_SQUARES  ; Continua o loop se não atingiu
HM          ; Finaliza

; Variáveis e constantes
@ /0200
RESULT     K /0000  ; Armazena o quadrado anterior
MAX_COUNT  K /003F  ; Valor máximo (63)
ZERO       K /0000  ; Constante 0
ONE        K /0001  ; Constante 1
TWO        K /0002  ; Constante 2
COUNTER    K /0000  ; Índice do loop
NUMBER     K /0000  ; Contador de iterações
INCREMENT  K /0001  ; Incremento inicial (2n+1)

@ /0300
MEMORY_ADDR K /0100  ; Endereço inicial para armazenar resultados

; Segunda abordagem otimizada de somatório
@ /0400
CALC_SUM
LD PREV_N  ; Carrega N - 1
ML TWO      ; Multiplica por 2
AD ONE      ; Soma 1
AD TEMP_VAR ; Soma TEMP_VAR
MM TEMP_VAR ; Atualiza TEMP_VAR
STORE MM /104  ; Armazena resultado

LD PREV_N   ; Incrementa PREV_N
AD ONE
MM PREV_N
SB SIXTY_THREE ; Compara com 63
JZ END_SUM     ; Sai se atingir limite

LD STORE    ; Atualiza próximo endereço de armazenamento
AD TWO
MM STORE
JP CALC_SUM

@ /0500
END_SUM
HM          ; Finaliza

; Variáveis e constantes
@ /F00
PREV_N     K /0001  ; N - 1
SIXTY_THREE K /003F  ; 63
ONE        K /0001  ; Constante 1
TWO        K /0002  ; Constante 2
TEMP_VAR   K /0001  ; Temporário para armazenar soma
