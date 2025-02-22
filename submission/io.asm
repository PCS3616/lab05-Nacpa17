        @000
INICIO  GD /000          ; Lê entrada do usuário
        SB CONST         ; Subtrai a constante
        MM X_D1         ; Armazena em X_D1
        GD /000         ; Lê segunda entrada
        SB CONST         ; Subtrai a constante
        MM X_D2         ; Armazena em X_D2
        LD X_D1         ; Carrega X_D1
        MM SUM          ; Inicializa soma
        LD X_D2         ; Carrega X_D2
        AD SUM          ; Soma os valores
        MM SUM          ; Armazena soma
        JP CONTIN       ; Pula para continuação

        @300
CONTIN  LD SUM          ; Carrega soma
        AD CONST        ; Adiciona constante
        PD /100         ; Envia para saída
        HM /000         ; Finaliza execução

        @F00
X_D1    K =0           ; Variável X_D1
X_D2    K =0           ; Variável X_D2
CONST   K =3030       ; Constante usada para conversão
SUM     K =0           ; Variável para soma
SUPA    K /000A       ; Valor de referência
NORMA   K /000A       ; Valor de normalização
VAL     K /0100       ; Valor base
