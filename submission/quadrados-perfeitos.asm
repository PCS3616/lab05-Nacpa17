; Programa principal
@ /0000
SC /000E  ; Chama a sub-rotina principal
HM /009A  ; Finaliza o programa

; Sub-rotina principal: Cálculo da série
@ /000E
K /0000
LD /008E  ; Carrega a constante 2 para multiplicação
ML /008A  ; Multiplica pelo "i"
AD /0090  ; Forma o termo (2*i + 1)
AD /0092  ; Soma as parcelas subsequentes do somatório
MM /0092  ; Armazena o resultado parcial
LD /008C  ; Carrega "n" para decrementar no somatório
SB /0090  ; Decrementa "n"
MM /008C  ; Atualiza o limite do somatório
JZ /0050  ; Se "n" for zero, sai do loop
LD /008A  ; Carrega "i"
AD /0090  ; Incrementa para formar a próxima parcela 2*i
MM /008A  ; Atualiza "i"
JP /000E  ; Volta ao início do loop

; Finalização do somatório
@ /0050
LD /0092  ; Carrega o resultado
MM /0102  ; Atualiza ponteiro do resultado
LD /0102  
AD /008E  ; Incrementa a memória de dois em dois
MM /0102
LD /0098  ; Load para resetar valores
MM /0092  ; Zera o resultado acumulado
MM /008A  ; Zera "i" para evitar problemas
LD /0094  ; Auxiliar para controle de "n"
AD /0090  ; Incrementa o auxiliar
MM /0094
MM /008C
SB /0096  ; Contagem até 63 para encerrar
JZ /0070  ; Se chegou a 63, sai
JP /000E  ; Continua o loop

@ /0070
RS /000E  ; Retorna da sub-rotina

; Variáveis e constantes usadas na sub-rotina
@ /008A
K /0000  ; "i" do somatório
K /0001  ; "n"
K /0002  ; Constante para multiplicação
K /0001  ; Constante para incremento/decremento
K /0000  ; Auxiliar do resultado
K /0001  ; Auxiliar do "n"
K /0040  ; Constante de parada (64 em decimal)
K /0000  ; Zero para evitar erros

; Segunda abordagem otimizada do cálculo do somatório
@ /0200
JUMP    LD /0F00  ; Carrega NMO (N - 1)
        ML /0F02  ; Multiplica por 2
        AD /0F01  ; Soma 1
        AD /0F04  ; Soma TEMP
        MM /0F04  ; Atualiza TEMP
        MM /0104  ; Armazena resultado
        LD /0F00  ; Carrega NMO
        AD /0F01  ; Incrementa NMO
        MM /0F00
        SB /0F03  ; Subtrai 63
        JZ /00F0  ; Se for 0, finaliza
        LD /0204  ; Incrementa armazenamento
        AD /0F02  ; Adiciona 2
        MM /0204
        JP /0200  ; Retorna ao loop

@ /00F0
EXIT    HM /00F0  ; Finaliza

; Variáveis e constantes da segunda abordagem
@ /0F00
NMO      K /0001  ; N - 1
SIXTHREE K /0063  ; 63
ONE      K /0001  ; Constante 1
TWO      K /0002  ; Constante 2
TEMP     K /0001  ; Temporário

; Sub-rotina alternativa otimizada
@ /200
SUBR    K /0000
LOOP    LD /0302
        ML /0303
        AD /0301
        MM /0304
        JP /0310
BACKLD  AD /0304
        JP /0320
BACKMM  LD /0320
        AD /0303
        MM /0320
        LD /0310
        AD /0303
        MM /0310
        LD /0302
        AD /0301
        MM /0302
        LD /0305
        SB /0302
        JN /0330
        JP /200
ENDSUBR RS /200

@ /300
UM      K =1
DOIS    K =2
i       K =0
TEMP    K =0
N       K =63
LOAD    K /8100
        JP /BACKLD
MEMMV   K /9102
        JP /BACKMM
