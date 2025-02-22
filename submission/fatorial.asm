; Programa principal
@ /0000
LD /100    ; Carrega N no acumulador
JZ /300    ; Se N for 0, desvia para tratar caso especial
SC /200    ; Chama a sub-rotina para calcular fatorial
HM /006    ; Finaliza o programa

; Sub-rotina para calcular fatorial
@ /0200
K /0006    ; Início da sub-rotina
LD /100    ; Carrega N no acumulador
MM /00C    ; Armazena N em NTemp
MM /00A    ; Armazena N em FatTemp

@ /0208
LD /00C    ; Carrega NTemp
SB /008    ; Subtrai 1
JZ /218    ; Se NTemp == 1, termina o loop
MM /00C    ; Salva novo NTemp
LD /00A    ; Carrega FatTemp
ML /00C    ; Multiplica novo NTemp por FatTemp
MM /00A    ; Atualiza FatTemp
JP /208    ; Volta para o início do loop

@ /0218
LD /00A    ; FatTemp no acumulador
MM /102    ; Armazena o resultado em 0x102
RS /200    ; Retorna da sub-rotina

; Tratamento do caso especial N=0
@ /0300
LV /001    ; Carrega 1 no acumulador
MM /102    ; Armazena em 0x102
HM /304    ; Finaliza o programa

; Constantes e variáveis
@ /0008
K /0001    ; Constante para decrementar (1)
@ /000A
K /0001    ; Variável para armazenar o fatorial (FatTemp)
@ /000C
K /0001    ; Variável temporária para N durante o loop (NTemp)

; Segunda abordagem de fatorial (não utilizada, mas otimizada)
@ /0400  
LD /001    ; Carrega 1 no acumulador
MM /101    ; Armazena em RES (resultado inicializado com 1)
LD /100    ; Carrega N no acumulador
JZ /0500   ; Se N == 0, pula para FIM (fatorial de 0 é 1)

@ /0410
LD /100    ; Carrega N no acumulador
JZ /0500   ; Se N == 0, termina
ML /101    ; Multiplica AC por RES
MM /101    ; Atualiza RES com o novo valor
LD /100    ; Carrega N no acumulador
SB /001    ; Decrementa N
MM /100    ; Atualiza N
JP /0410   ; Volta para LOOP

@ /0500
HM /0000   ; Finaliza
