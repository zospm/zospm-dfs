*
*   VTAM USS TABLE
*
IVPUSSTB USSTAB  TABLE=STDTRANS
LOGON    USSCMD  CMD=LOGON,FORMAT=BAL,REP=LOGON
         USSPARM PARM=APPLID,DEFAULT=TSO
         USSPARM PARM=P1,REP=DATA
TSO      USSCMD  CMD=TSO,FORMAT=BAL,REP=LOGON
         USSPARM PARM=APPLID,DEFAULT=TSO
         USSPARM PARM=P1,REP=DATA
*
* LOGON REQUIRES BOTH THE INTERPRET TABLE AND THE USS TABLE.
*
* THE FIRST PASS THROUGH THE INTERPRET TABLE DOES NOT FIND A MATCH.
*
* THE PASS THROUGH THE USS TABLE FINDS A MATCH AND GENERATES A LOGON
* COMMAND TO A BOGUS APPLID.
*
* THE SECOND PASS THROUGH THE INTERPRET TABLE RESULTS IN A MATCH ON
* THE BOGUS APPLID AND CHANGES THE APPLID TO A LEGITIMATE VALUE.
*
IVP      USSCMD  CMD=IVP,FORMAT=BAL,REP=LOGON
         USSPARM PARM=P1,REP=APPLID,DEFAULT=Z1ZIVP
         EJECT
MESSAGES USSMSG  MSG=0,TEXT='MSG0: PLEASE STANDBY .....'
         USSMSG  MSG=1,TEXT='MSG1: WHAT DO YOU MEAN % ?'
         USSMSG  MSG=2,BUFFER=HELP      -----ENTER KEY
         USSMSG  MSG=3,TEXT='MSG3: % PARAMETER UNRECOGNIZED'
         USSMSG  MSG=4,TEXT='MSG4: % IS NOT ACTIVE'
         USSMSG  MSG=5,BUFFER=HELP      -----ALL OTHER KEYS
         USSMSG  MSG=6,TEXT='MSG6: SEQUENCE ERROR'
         USSMSG  MSG=7,TEXT='MSG7: % IS NOT ACTIVE'
         USSMSG  MSG=8,TEXT='MSG8: INSUFFICIENT STORAGE'
         USSMSG  MSG=10,BUFFER=LOGO
         USSMSG  MSG=12,TEXT='MSG12: REQUIRED PARAMETER OMITTED'
         USSMSG  MSG=13,TEXT='MSG13: IBMECHO % %(2) %(3) %(4)'
         EJECT
STDTRANS DC      X'000102030440060708090A0B0C0D0E0F'
         DC      X'101112131415161718191A1B1C1D1E1F'
         DC      X'202122232425262728292A2B2C2D2E2F'
         DC      X'303132333435363738393A3B3C3D3E3F'
         DC      X'404142434445464748494A4B4C4D4E4F'
         DC      X'505152535455565758595A5B5C5D5E5F'
         DC      X'606162636465666768696A6B6C6D6E6F'
         DC      X'707172737475767778797A7B7C7D7E7F'
         DC      X'80C1C2C3C4C5C6C7C8C98A8B8C8D8E8F' LOWER CASE A-I
         DC      X'90D1D2D3D4D5D6D7D8D99A9B9C9D9E9F' LOWER CASE J-R
         DC      X'A0A1E2E3E4E5E6E7E8E9AAABACADAEAF' LOWER CASE S-Z
         DC      X'B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF'
         DC      X'C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF'
         DC      X'D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF'
         DC      X'E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF'
         DC      X'F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF'
         EJECT
LOGO     DC      AL2(LOGOEND-*-2)
 DC X'F5C711C14F1DE0'
 DC X'11C1E3',C'IIIIIIIIIII    VVV      VVV    PPPPPPPPP   '
 DC X'11C2F3',C'IIIIIIIIIII    VVV      VVV    PPPPPPPPPPP '
 DC X'11C4C3',C'    III        VVV      VVV    PPPPPPPPPPPP'
 DC X'11C5D3',C'    III        VVV      VVV    PPP      PPP'
 DC X'11C6E3',C'    III        VVV      VVV    PPP      PPP'
 DC X'11C7F3',C'    III        VVV      VVV    PPPPPPPPPPPP'
 DC X'11C9C3',C'    III        VVV      VVV    PPPPPPPPPPP '
 DC X'114AD3',C'    III         VVV    VVV     PPPPPPPPP   '
 DC X'114BE3',C'    III          VVV  VVV      PPP         '
 DC X'114CF3',C'    III           VVVVVV       PPP         '
 DC X'114EC3',C'IIIIIIIIIII        VVVV        PPP         '
 DC X'114FD3',C'IIIIIIIIIII         VV         PPP         '
 DC X'11D3C3',C'             IMS IVP                       '
 DC X'115DC3',C'   PRESS ENTER KEY FOR LOGON INFORMATION   '
 DC X'1140401D401311407A40'      INSERT CURSOR AND SET UNPROTECTED
LOGOEND  EQU     *
         EJECT
HELP     DC      AL2(HELPEND-*-2)
 DC X'F5C711C14F1DE0'
 DC X'11C1E3',C'                                         '
 DC X'11C2F3',C'ENTER ONE OF THE FOLLOWING COMMANDS:     '
 DC X'11C4C3',C'                                         '
 DC X'11C5D3',C'IVP      - LOGON TO IVP                  '
 DC X'11C6E3',C'                                         '
 DC X'11C7F3',C'                                         '
 DC X'11C9C3',C'                                         '
 DC X'114AD3',C'                                         '
 DC X'114BE3',C'LOGON    - LOGON TO TSO                  '
 DC X'114CF3',C'                                         '
 DC X'114EC3',C'TSO      - LOGON TO TSO                  '
 DC X'114FD3',C'                                         '
 DC X'1150E3',C'                                         '
 DC X'11D1F3',C'                                         '
 DC X'11D3C3',C'OR PRESS CLEAR KEY TO RETURN             '
 DC X'1140401D401311407A40'      INSERT CURSOR AND SET UNPROTECTED
HELPEND  EQU     *
END      USSEND
         END IVPUSSTB