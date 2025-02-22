        @000
INICIO  LV 0            ; Inicializa AC com 0 (n)
        MM N            ; Armazena n
        MM QUADRADO     ; Inicializa quadrado de n
        MM SOMA         ; Inicializa soma parcial
        LV 1            ; Inicializa o primeiro ímpar (2*i + 1)
        MM IMPAR

LOOP    LD QUADRADO     ; Carrega o quadrado atual
        AD IMPAR        ; Soma o próximo ímpar
        MM QUADRADO     ; Atualiza o quadrado
        LD SOMA         ; Carrega a soma parcial
        AD QUADRADO     ; Adiciona o quadrado
        MM SOMA         ; Atualiza a soma parcial
        LD QUADRADO     ; Armazena o quadrado na memória
        MM 0x100+N
        LD IMPAR        ; Carrega o próximo ímpar
        AD 2           ; Incrementa de 2
        MM IMPAR        ; Atualiza o valor ímpar
        LD N            ; Carrega n
        AD 1            ; Incrementa n
        MM N            ; Atualiza n
        JZ FIM          ; Se n == 64, termina
        JP LOOP         ; Continua o loop

FIM     HM =0           ; Halt machine

        @100
N        K /0000        ; Contador de n
QUADRADO K /0000        ; Armazena o quadrado atual
SOMA     K /0000        ; Soma parcial dos quadrados
IMPAR    K /0001        ; Próximo ímpar a ser somado
