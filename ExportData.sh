#!/usr/bin/env sh
CONSTR=`cat ${RPT_HOME}/etc/branch.etc`
CONSTR=`sh ~/bin/dec.sh ${CONSTR}`
DBSCHEMA=${CONSTR##*@}
echo ${DBSCHEMA}
DBUSER=${CONSTR%%/*}
echo ${DBUSER}
temp=${CONSTR##*/}
DBPASSWORD=${temp%%@*}
echo ${DBPASSWORD}
tabname=$1
echo ${tabname}
updtbl_date="updtbl_date" 
if [ ${tabname} = "CITACR" ]
  then
  updtbl_date="update_date"
  echo "updtbl_date:"${updtbl_date}
fi
echo "updtbl_date:"${updtbl_date}
tabschema='ODS';
AC_DATE=`sh $HOME/bin/getaccdt.sh`
LAST_AC_DATE=
echo 'AC_DATE:'${AC_DATE}

############################################################
# : wlog String
############################################################
wlog () {
   wlog_dt=`date "+%Y/%m/%d-%H:%M:%S" `
   echo "\n${wlog_dt} $1"
}

############################################################
# : db2connect db2connstring
############################################################
connDB2() {
    wlog "====================connect to $1======================="
     wlog "db2 connect to $1 user $2 "
	 
    if( db2 connect to $1 user $2 using $3 > /dev/null )
    then
        wlog "Succeed connect to $1 "
    else
        wlog "Failed connect to $1 "
        exit -1
    fi
}

############################################################
# : db2connectRelease db2connstring
############################################################
releaseDB2() {
    db2 connect reset  > /dev/null
}

############################################################
# : db2export
############################################################
exportDB2() {
       # 连接db2
	   connDB2 ${DBSCHEMA} ${DBUSER} ${DBPASSWORD}
	   echo "tabname:"${tabname}
#	   得到全部的表的字段
	   result=`db2 -x "SELECT listagg(colname,' || ''\\\`|\\\`'' || ') C FROM (select colname from syscat.columns where tabname = '${tabname}' and tabschema = '${tabschema}' order by colno)" `  
#      导出数据操作 -- 数据头部的处理  --  文本的操作  -- 尾部的操作
       echo "export to /dsbhk/sit1/report/download/"${tabschema}_${tabname}".txt of del modified by nochardel  select '0\`|\`' || right(to_char(' '), 11) || '\`|\`' || to_char(to_date('${AC_DATE}', 'yyyymmdd'),'yyyymmdd') || '\`|\`' || right(to_char('0'), 6) || '\`|\`' || right(to_char('IBS'), 5) || '\`|\`' || right(to_char('ALL'), 5) || '\`|\`' as field from sysibm.sysdummy1 union select  '1\`|\`' || ${result} || '\`|\`'  fields from "${tabschema}.${tabname}" where (substr(to_char(to_date("${updtbl_date}", 'yyyymmdd'),'yyyymmdd'),1,6)) = substr(to_char(to_date('${AC_DATE}', 'yyyymmdd'),'yyyymmdd'),1,6) union select '9\`|\`'||right(digits(count(*)),10) || '\`|\`' as field from "${tabschema}.${tabname}" where (substr(to_char(to_date("${updtbl_date}", 'yyyymmdd'),'yyyymmdd'),1,6)) = (substr(to_char(to_date('${AC_DATE}', 'yyyymmdd'),'yyyymmdd'),1,6))" 
	   db2 "export to /dsbhk/sit1/report/download/"${tabschema}_${tabname}".txt of del modified by nochardel  select '0\`|\`' || right(to_char(' '), 11) || '\`|\`' || to_char(to_date('${AC_DATE}', 'yyyymmdd'),'yyyymmdd') || '\`|\`' || right(to_char('0'), 6) || '\`|\`' || right(to_char('IBS'), 5) || '\`|\`' || right(to_char('ALL'), 5) || '\`|\`' as field from sysibm.sysdummy1 union select  '1\`|\`' || ${result} || '\`|\`' fields from "${tabschema}.${tabname}"  where (substr(to_char(to_date("${updtbl_date}", 'yyyymmdd'),'yyyymmdd'),1,6)) = substr(to_char(to_date('${AC_DATE}', 'yyyymmdd'),'yyyymmdd'),1,6) union select '9\`|\`'||right(digits(count(*)),10) || '\`|\`' as field from "${tabschema}.${tabname}" where (substr(to_char(to_date("${updtbl_date}", 'yyyymmdd'),'yyyymmdd'),1,6)) = (substr(to_char(to_date('${AC_DATE}', 'yyyymmdd'),'yyyymmdd'),1,6))"   
	 
}

############################################################
# : main
############################################################
run() {

    echo "Begin to export the data: "
    exportDB2

    echo "Close the connection."
    releaseDB2
}

echo "execute sql ................."
run
