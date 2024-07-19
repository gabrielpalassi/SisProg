< STRLEN

@ /0000
            JP MAIN

@ /0100
PASS        K /0   ; 0 mean sucess
MAIN        LV  MAIN
            ; test ONE_STR
            LV  ONE_STR
            SC  STRLEN
            SB  ONE_STR_EXPECTED
            AD  PASS
            MM  PASS

            ; test EMPTY_STR
            LV  EMPTY_STR
            SC  STRLEN
            SB  EMPTY_STR_EXPECTED
            AD  PASS
            MM  PASS

            ; test TWO_STR
            LV  TWO_STR
            SC  STRLEN
            SB  TWO_STR_EXPECTED
            AD  PASS
            MM  PASS

            ; test THREE_STR
            LV  THREE_STR
            SC  STRLEN
            SB  THREE_STR_EXPECTED
            AD  PASS
            MM  PASS

            ; test FOUR_STR
            LV  FOUR_STR
            SC  STRLEN
            SB  FOUR_STR_EXPECTED
            AD  PASS
            MM  PASS

            ; test FIVE_STR
            LV  FIVE_STR
            SC  STRLEN
            SB  FIVE_STR_EXPECTED
            AD  PASS
            MM  PASS

            HM  MAIN


@ /0800
EMPTY_STR_EXPECTED  K /0
EMPTY_STR   K   /0000

ONE_STR_EXPECTED  K /1
ONE_STR     K   /3100

TWO_STR_EXPECTED  K /2
TWO_STR     K   /3132
            K   /00FF ; with some garbage

THREE_STR_EXPECTED  K /3
THREE_STR   K   /3132
            K   /3300

FOUR_STR_EXPECTED  K /4
FOUR_STR    K   /3132
            K   /3334
            K   /0000

FIVE_STR_EXPECTED  K /5
FIVE_STR    K   /3132
            K   /3334
            K   /3500

MANY_STR_EXPECTED  K /106
MANY_STR    K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /0000

MANY_STR_EXPECTED  K /107
MAN_PL1_STR K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C0DE
            K   /C000

# MAIN
