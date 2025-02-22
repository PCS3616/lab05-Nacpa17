@ /000
INICIO  LD VALOR_N      # Carrega o valor de VALOR_N no acumulador
        SC CALC_FATORIAL # Chama a sub-rotina CALC_FATORIAL
FIM     HM =0           # Para a execução do programa

@ /100
VALOR_N K /0000         # Valor de N (entrada)
RESULT  K /0000         # Resultado (saída)

@ /200
CALC_FATORIAL K /0000   # Início da sub-rotina CALC_FATORIAL
        JZ N_ZERO       # Se VALOR_N for zero, pula para N_ZERO
        MM CONTADOR      # Armazena VALOR_N na variável CONTADOR
        MM RESULT        # Armazena VALOR_N em RESULT (inicializa RESULT com VALOR_N)
LOOP    LD CONTADOR      # Carrega o valor de CONTADOR no acumulador
        SB UM            # Subtrai 1 de CONTADOR (UM = 1)
        MM CONTADOR      # Armazena o novo valor de CONTADOR
        JZ FIM_SUBROTINA # Se CONTADOR for zero, termina a sub-rotina
        ML RESULT        # Multiplica RESULT por VALOR_N (acumulador contém VALOR_N)
        MM RESULT        # Armazena o resultado em RESULT
        JP LOOP          # Repete o loop
N_ZERO  LV =1            # Se VALOR_N for zero, carrega 1 no acumulador
        MM RESULT        # Armazena 1 em RESULT (0! = 1)
FIM_SUBROTINA RS CALC_FATORIAL # Retorna da sub-rotina

@ /300
UM      K =1            # Constante 1 (usada para decrementar CONTADOR)
CONTADOR K =0           # Variável de controle do loop (contador)
