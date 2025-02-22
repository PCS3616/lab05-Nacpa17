        @000
INICIO  LD N
        SC CALC_FAT
        HM =0

        @100
N       K /0000
RESULT  K /0000

        @200
CALC_FAT K /0000
        JZ CASO_ZERO
        MM TEMP
        MM RESULT

CICLO   LD TEMP
        SB UM
        MM TEMP
        JZ FINALIZA
        ML RESULT
        MM RESULT
        JP CICLO

CASO_ZERO LV =1
        MM RESULT
FINALIZA RS CALC_FAT

        @390
UM      K =1
TEMP    K =0
