//IMSRUN JOB
//NODE1 SET NODE1=ZOSPMT
//NODE2 SET NODE2=ZOSPMT
//SYS   SET SYS=DFSF20
//SYS1  SET SYS1=DFSF20
//SYS2  SET SYS2=DFSF20
//RGSUF SET RGSUF=IMS
//SOUT  SET SOUT='*'
//RGN   SET RGN=64M
//DPTY  SET DPTY='(14,15)'
//PARM1 SET PARM1=
//PARM2 SET PARM2=
//RUN   EXEC PGM=DFSMVRC0,DPRTY=&DPTY,                                  00480000
//            REGION=&RGN,                                              00490000
//            PARM='CTL,&RGSUF,&PARM1,&PARM2'                           00500000
//STEPLIB  DD DSN=&NODE2..&SYS2..SDFSRESL,DISP=SHR                      04050000
//IMSIRD   DD SYSOUT=(A,INTRDR)                                         04140000
//QBLKS    DD DSN=&NODE1..&SYS1..QBLKS,DISP=OLD                         04670000
//SHMSG    DD DSN=&NODE1..&SYS1..SHMSG,DISP=OLD                         04680000
//LGMSG    DD DSN=&NODE1..&SYS1..LGMSG,DISP=OLD                         04690000
//IMSACBA  DD DSN=&NODE1..&SYS2..ACBLIBA,DISP=SHR                       04810000
//IMSACBB  DD DSN=&NODE1..&SYS2..ACBLIBB,DISP=SHR                       04820000
//MODBLKSA DD DSN=&NODE2..&SYS2..MODBLKSA,DISP=SHR                      04830000
//MODBLKSB DD DSN=&NODE2..&SYS2..MODBLKSB,DISP=SHR                      04840000
//MODSTAT  DD DSN=&NODE1..&SYS..MODSTAT,DISP=SHR                        04850000
//FORMATA  DD DSN=&NODE1..&SYS2..FORMATA,DISP=SHR                       05100000
//FORMATB  DD DSN=&NODE1..&SYS2..FORMATB,DISP=SHR                       05110000
//SYSUDUMP DD SYSOUT=&SOUT,                                             05220000
//         DCB=(LRECL=125,RECFM=FBA,BLKSIZE=3129),                      05230000
//         SPACE=(6050,300,,,ROUND)                                     05240000
//IMSRDS   DD DSN=&NODE1..&SYS..RDS,DISP=SHR                            05250000
//PRINTDD  DD SYSOUT=&SOUT                                              05310000
