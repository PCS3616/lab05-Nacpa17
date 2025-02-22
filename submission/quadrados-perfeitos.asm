; Programa principal
@ /0000
SC /0100    ; Chama a sub-rotina para calcular quadrados perfeitos
HM /009A    ; Finaliza

; Sub-rotina para calcular quadrados perfeitos
@ /0100
LD ZERO     ; Inicializa acumulador com 0
MM PREV_RES ; Armazena primeiro quadrado (0² = 0)
LD ONE      ; Carrega constante 1
MM INCR     ; Configura incremento inicial (2n + 1)
LD ZERO     ; Inicializa índice i
MM I        ; Armazena índice
LD ZERO     ; Inicializa N
MM N        ; Armazena contador

LOOP_START
LD I        ; Carrega i
ML TWO      ; Multiplica por 2
AD ONE      ; Adiciona 1 (2i + 1)
AD PREV_RES ; Soma ao resultado anterior
MM PREV_RES ; Atualiza resultado
SALVAR MM ADDR  ; Armazena resultado na memória

LD SALVAR   ; Atualiza endereço de memória
AD TWO      ; Avança para próximo local de armazenamento
MM SALVAR

LD I        ; Incrementa índice i
AD ONE      
MM I

LD N        ; Incrementa N
AD ONE
MM N
SB LIMIT    ; Verifica se atingiu o limite (63)
JN LOOP_START  ; Continua o loop se não atingiu
HM          ; Finaliza

; Variáveis e constantes
@ /0200
PREV_RES K /0000  ; Armazena o quadrado anterior
LIMIT    K /003F  ; Valor máximo (63)
ZERO     K /0000  ; Constante 0
ONE      K /0001  ; Constante 1
TWO      K /0002  ; Constante 2
I        K /0000  ; Índice do loop
N        K /0000  ; Contador de iterações
INCR     K /0001  ; Incremento inicial (2n+1)

@ /0300
ADDR     K /0100  ; Endereço inicial para armazenar resultados

; Segunda abordagem otimizada de somatório
@ /0400
JUMP
LD NMO      ; Carrega NMO (N - 1)
ML TWO      ; Multiplica por 2
AD ONE      ; Soma 1
AD TEMP     ; Soma TEMP
MM TEMP     ; Atualiza TEMP
STORE MM /104  ; Armazena resultado

LD NMO      ; Incrementa NMO
AD ONE
MM NMO
SB SIXTHREE ; Compara com 63
JZ EXIT     ; Sai se atingir limite

LD STORE    ; Atualiza próximo endereço de armazenamento
AD TWO
MM STORE
JP JUMP

@ /0500
EXIT
HM          ; Finaliza

; Variáveis e constantes
@ /F00
NMO      K /0001  ; N - 1
SIXTHREE K /003F  ; 63
ONE      K /0001  ; Constante 1
TWO      K /0002  ; Constante 2
TEMP     K /0001  ; Temporário para armazenar soma
