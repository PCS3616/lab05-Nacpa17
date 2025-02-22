        @000
INICIO  LD N
        JZ CASO_ZERO    ; Se N for zero, resultado é 1
        LV 1            ; Inicializa AC com 1
        MM RESULT       ; Armazena o resultado inicial
        MM TEMP         ; Copia N para TEMP

LOOP    LD TEMP        ; Carrega TEMP
        SB UM          ; Decrementa TEMP
        JZ FIM         ; Se TEMP for 0, termina
        MM TEMP        ; Atualiza TEMP
        ML RESULT      ; Multiplica pelo resultado atual
        MM RESULT      ; Armazena o novo resultado
        JP LOOP        ; Continua loop

CASO_ZERO LV 1         ; Caso especial: fatorial(0) = 1
        MM RESULT

FIM     HM =0          ; Termina execução

        @100
N       K /0000        ; Entrada do número
RESULT  K /0000        ; Resultado do fatorial
TEMP    K /0000        ; Variável temporária

        @390
UM      K =1           ; Constante 1
