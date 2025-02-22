@ /000
MAIN    LD INPUT_VAL    # Carrega o valor de INPUT_VAL no acumulador
        SC COMPUTE_FACT # Chama a sub-rotina COMPUTE_FACT
HALT    HM =0           # Pausa a execução do programa

@ /100
INPUT_VAL K /0000       # Valor de entrada para o cálculo do fatorial
FACT_RES K /0000        # Armazena o resultado do fatorial

@ /200
COMPUTE_FACT K /0000    # Início da sub-rotina COMPUTE_FACT
        JZ IF_ZERO      # Se INPUT_VAL for zero, pula para IF_ZERO
        MM COUNTER       # Armazena INPUT_VAL em COUNTER (contador)
        MM FACT_RES      # Inicializa FACT_RES com INPUT_VAL
FACT_LOOP LD COUNTER    # Carrega o valor de COUNTER no acumulador
        SB ONE           # Subtrai 1 de COUNTER (ONE = 1)
        MM COUNTER       # Atualiza o valor de COUNTER
        JZ FACT_DONE    # Se COUNTER for zero, termina o cálculo
        ML FACT_RES      # Multiplica FACT_RES por INPUT_VAL
        MM FACT_RES      # Armazena o resultado em FACT_RES
        JP FACT_LOOP    # Repete o loop
IF_ZERO  LV =1           # Se INPUT_VAL for zero, carrega 1 no acumulador
        MM FACT_RES      # Armazena 1 em FACT_RES (0! = 1)
FACT_DONE RS COMPUTE_FACT # Retorna da sub-rotina

@ /300
ONE     K =1            # Constante 1 (usada para decrementar COUNTER)
COUNTER K =0            # Variável de controle do loop (contador)
