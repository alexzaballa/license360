/*****************************************************************************************/

DEF title = 'ENABLE_DDL_LOGGING';
DEF main_table = 'gv$parameter';
BEGIN
  :sql_text := q'[
select inst_id,name, value as value_, isdefault
  from GV$PARAMETER
  where UPPER(name) like '%CONTROL_MANAGEMENT_PACK_ACCESS%'
     or UPPER(name) like '%ENABLE_DDL_LOGGING%'
  order by 1
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
