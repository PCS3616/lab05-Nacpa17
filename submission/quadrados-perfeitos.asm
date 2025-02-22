; Início do loop principal
INICIO_LOOP    LD INDICE      ; Carrega o índice atual
              ML DOIS        ; Multiplica por 2
              AD UM          ; Soma 1 ao resultado
              AD ULTIMO_RES  ; Soma ao último resultado armazenado
              MM ULTIMO_RES  ; Armazena o novo resultado
              SALVAR MM ENDERECO_TEMP ; Salva o valor em ENDERECO_TEMP
              LD SALVAR      ; Carrega o valor salvo
              AD DOIS        ; Soma 2
              MM SALVAR      ; Armazena o novo valor
              LD INDICE      ; Carrega o índice
              AD UM          ; Incrementa o índice
              MM INDICE      ; Armazena o novo valor do índice
              LD CONTADOR    ; Carrega o contador
              AD UM          ; Incrementa o contador
              MM CONTADOR    ; Armazena o novo valor do contador
              SB LIMITE      ; Verifica se atingiu o limite
              JN INICIO_LOOP ; Se não atingiu, repete o loop
              HM INICIO_LOOP ; Finaliza o programa

; Definição de variáveis e constantes
ULTIMO_RES    K /0000  ; Último resultado armazenado
LIMITE        K /003F  ; Limite da contagem (por exemplo, 63 em hexadecimal)
ZERO          K /0000  ; Constante zero
UM            K /0001  ; Constante um
DOIS          K /0002  ; Constante dois
INDICE        K /0000  ; Índice atual do loop
CONTADOR      K /0000  ; Contador para controle do loop
@            /0100    ; Endereço inicial
M_INICIO      K /0000  ; Marcador de início do programa
ENDERECO_TEMP K /0000  ; Endereço temporário para armazenamento
