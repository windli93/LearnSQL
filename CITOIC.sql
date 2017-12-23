
-- 注意：改结构要同时更改位于 目录 03 报表源码\01 建表语句\特殊表定义\CITOIC_DELTA ,CITOIC_DELTA2 的结构。

DROP TABLE ODS.CITOIC;

CREATE TABLE ODS.CITOIC  (
   OIC_NO                   CHAR(10) DEFAULT ' ' NOT NULL,
   BOOK_BCH                 DEC(6, 0) DEFAULT 0 ,
   TEAM_NO                  CHAR(10) DEFAULT ' ' ,
   NAME                     CHAR(70) DEFAULT ' ' ,
   TEL_NO                   CHAR(18) DEFAULT ' ' ,
   EMAIL                    CHAR(50) DEFAULT ' ' ,
   STAFF_NO                 CHAR(10) DEFAULT ' ' ,
   REGH_FLG                 CHAR(1) DEFAULT ' ' ,
   LEADER_FLG               CHAR(1) DEFAULT ' ' ,
   TLR_ID                   CHAR(8) DEFAULT ' ' ,
   CREATE_UNIT              DEC(6, 0) DEFAULT 0 ,
   CREATE_TLR               CHAR(8) DEFAULT ' ' ,
   CREATE_DATE              DEC(8, 0) DEFAULT 0 ,
   CREATE_TIME              DEC(6, 0) DEFAULT 0 ,
   LAST_UPD_DATE            DEC(8, 0) DEFAULT 0 ,
   LAST_UPD_TLR             CHAR(8) DEFAULT ' ' ,
   UPDTBL_DATE              DEC(8, 0) DEFAULT 0 NOT NULL,
   TS                       TIMESTAMP NOT NULL,
  PRIMARY KEY(OIC_NO)
 )

IN TBS_REPORT_DATA INDEX IN TBS_REPORT_IDX  COMPRESS YES ;
