IVPMODTB MODETAB
*
* DEFAULT
*
DEFAULT  MODEENT LOGMODE=DEFAULT,                                      X
               FMPROF=X'03',       FM PROFILE 3                        X
               TSPROF=X'03',       TS PROFILE 3                        X
               PRIPROT=X'31',      PRIMARY NAU PROTOCOL                X
               SECPROT=X'A0',      SECONDARY NAU PROTOCOL              X
               COMPROT=X'70',    COMMON NAU PROTOCOL                   X
               RUSIZES=X'8585',                                        X
               PSERVIC=X'013080008100000000000000', ATTN               X
               PSNDPAC=X'05',                                          X
               SRCVPAC=X'05',                                          X
               SSNDPAC=X'05'
*
* 3277 MOD 2
*
IBM3270  MODEENT LOGMODE=IBM3270,                                      X
               FMPROF=X'02',       FM PROFILE 2                        X
               TSPROF=X'02',       TS PROFILE 2                        X
               PRIPROT=X'71',      PRIMARY NAU PROTOCOL                X
               SECPROT=X'40',      SECONDARY NAU PROTOCOL              X
               COMPROT=X'2000'     COMMON NAU PROTOCOL
*
* 3274 MODEL 1B/1D (LOCAL NON-SNA)
* 3274 1C BSC
* 3276 BSC
* PRIMARY   SCREEN 24 X 80 (1920)
* ALTERNATE SCREEN TO BE DETERMINED BY THE APPLICATION
*
D4B32XX3 MODEENT LOGMODE=D4B32XX3,                                     X
               FMPROF=X'02',       FM PROFILE 2                        X
               TSPROF=X'02',       TS PROFILE 2                        X
               PRIPROT=X'71',      PRIMARY NAU PROTOCOL                X
               SECPROT=X'40',      SECONDARY NAU PROTOCOL              X
               COMPROT=X'2000',    COMMON NAU PROTOCOL                 X
               RUSIZES=X'0000',                                        X
               PSERVIC=X'008000000000000000000300'
*
* IMS (INCLUDING XRF ISC LINK)
*
IMS      MODEENT LOGMODE=IMS,                                          X
               FMPROF=X'12',       FM PROFILE                          X
               TSPROF=X'04',       TS PROFILE                          X
               PRIPROT=X'B1',      PRIMARY NAU PROTOCOL                X
               SECPROT=X'A0',      SECONDARY NAU PROTOCOL              X
               COMPROT=X'76A1',    COMMON NAU PROTOCOL                 X
               RUSIZES=X'0000',                                        X
               PSERVIC=X'060038000000380000000000',                    X
               PSNDPAC=X'00',                                          X
               SRCVPAC=X'00',                                          X
               SSNDPAC=X'00',                                          X
               ENCR=0,                                                 X
               TYPE=1
         MODEEND
         END IVPMODTB
