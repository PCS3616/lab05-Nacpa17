        @000
INICIO  LD N
        JZ CASO_ZERO    ; Se N for zero, pula para CASO_ZERO
        LV 1            ; Inicializa AC com 1 (resultado inicial)
        MM RESULT       ; Armazena o resultado inicial
        MM TEMP         ; Copia N para TEMP

CICLO   LD TEMP        ; Carrega TEMP
        SB UM          ; Subtrai 1
        JZ FINALIZA    ; Se TEMP for 0, termina
        MM TEMP        ; Atualiza TEMP
        ML RESULT      ; Multiplica pelo valor atual do resultado
        MM RESULT      ; Armazena o novo resultado
        JP CICLO       ; Repete o loop

CASO_ZERO LV 1         ; Caso especial fatorial(0) = 1
        MM RESULT

FINALIZA HM =0        ; Termina a execução

        @100
N       K /0000       ; Entrada do número
RESULT  K /0000       ; Resultado do fatorial
TEMP    K /0000       ; Variável temporária

        @390
UM      K =1          ; Constante 1
