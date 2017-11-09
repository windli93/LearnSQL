
-- 注意：改结构要同时更改位于 目录 03 报表源码\01 建表语句\特殊表定义\CITOIC_DELTA ,CITOIC_DELTA2 的结构。

DROP TABLE ODS.CITOIC;

CREATE TABLE ODS.CITOIC  (
   OIC_NO                   CHAR(10) DEFAULT ' ' NOT NULL,
   BOOK_BCH                 DEC(6, 0) DEFAULT 0 NOT NULL,
   TEAM_NO                  CHAR(10) DEFAULT ' ' NOT NULL,
   NAME                     CHAR(70) DEFAULT ' ' NOT NULL,
   TEL_NO                   CHAR(18) DEFAULT ' ' NOT NULL,
   EMAIL                    CHAR(50) DEFAULT ' ' NOT NULL,
   STAFF_NO                 CHAR(10) DEFAULT ' ' NOT NULL,
   REGH_FLG                 CHAR(1) DEFAULT ' ' NOT NULL,
   LEADER_FLG               CHAR(1) DEFAULT ' ' NOT NULL,
   TLR_ID                   CHAR(8) DEFAULT ' ' NOT NULL,
   CREATE_UNIT              DEC(6, 0) DEFAULT 0 NOT NULL,
   CREATE_TLR               CHAR(8) DEFAULT ' ' NOT NULL,
   CREATE_DATE              DEC(8, 0) DEFAULT 0 NOT NULL,
   CREATE_TIME              DEC(6, 0) DEFAULT 0 NOT NULL,
   LAST_UPD_DATE            DEC(8, 0) DEFAULT 0 NOT NULL,
   LAST_UPD_TLR             CHAR(8) DEFAULT ' ' NOT NULL,
   UPDTBL_DATE              DEC(8, 0) DEFAULT 0 NOT NULL,
   TS                       TIMESTAMP NOT NULL,
  PRIMARY KEY(OIC_NO)
 )  
		 
IN TBS_REPORT_DATA INDEX IN TBS_REPORT_IDX  COMPRESS YES ;





