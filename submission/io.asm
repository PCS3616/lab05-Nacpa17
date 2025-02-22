; Programa principal
@ /0000
SC /0010  ; Sub-rotina de leitura dos dois primeiros dígitos
SC /0020  ; Sub-rotina de leitura dos espaços
SC /0030  ; Sub-rotina de leitura dos dois últimos dígitos
SC /0040  ; Sub-rotina de operação de soma
HM /006A  ; Finaliza o programa

; Sub-rotina: Leitura dos dois primeiros dígitos
@ /0010
K /0000
GD /000   ; Lê entrada do teclado
SB /0092  ; Ajusta conforme constante do enunciado
MM /0094  ; Armazena os dois primeiros dígitos
RS /0010  ; Retorna da sub-rotina

; Sub-rotina: Leitura dos espaços
@ /0020
K /0000
GD /000   ; Lê espaços
MM /0096  ; Armazena os espaços
RS /0020  ; Retorna da sub-rotina

; Sub-rotina: Leitura dos dois últimos dígitos
@ /0030
K /0000
GD /000   ; Lê entrada do teclado
SB /0092  ; Ajusta conforme constante do enunciado
MM /0098  ; Armazena os dois últimos dígitos
RS /0030  ; Retorna da sub-rotina

; Sub-rotina: Operação de soma
@ /0040
K /0000
LD /0094  ; Carrega os dois primeiros dígitos
AD /0098  ; Soma com os dois últimos dígitos
MM /009E  ; Armazena o resultado
SB /009A  ; Subtrai valor fixo para checar se é negativo
JN /0060  ; Se for negativo, desvia para tratamento especial
AD /009C  
AD /0092
PD /0100  ; Imprime o resultado
RS /0040  ; Retorna da sub-rotina

; Tratamento para valores negativos
@ /0060
LD /009E
AD /0092
PD /0100
RS /0040

; Constantes e variáveis
@ /0092
K /3030  ; Constante de operação do enunciado
K /0000  ; Armazena os dois primeiros dígitos
K /0000  ; Armazena os espaços
K /0000  ; Armazena os dois últimos dígitos
K /000A  ; Constante
K /0100  ; Constante
K /0000  ; Soma em hex ou não

; Alternativa otimizada para cálculo
@ /0300
CONTIN  LD /009E
        AD /0092
        PD /0100
        HM /0000

@ /0F00
X_D1    K =0
X_D2    K =0
Y_D1    K =0
Y_D2    K =0
CONST   K /3030
SUM     K =0
        K /0000
        K /0000
SUPA    K /0A00
NORMA   K /000A
VAL     K /0100

; Cálculo alternativo utilizando deslocamento e ajuste
@ /0200
VALUE   K /3030
SUB     K /000A
ADD     K /0100
SHIFT   K /1000
SUBA    K /A000

@ /0000
        GD /000
        SB VALUE
        MM /0100
        GD /000
        GD /000
        SB VALUE
        AD /0100
        MM /0100
        ML SHIFT
        SB SUBA
        JN PRINT
        LD /0100
        SB SUB
        AD ADD
        MM /0100
PRINT   LD /0100
        AD VALUE
        PD /0100
        HM /0000
