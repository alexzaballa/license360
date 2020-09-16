/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Active Data Guard'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Active Data Guard';
DEF main_table = 'v$archive_dest_status';
BEGIN
  :sql_text := q'[
SELECT DECODE(arch_dest.database_mode,'OPEN_READ-ONLY','Active Dataguard Enabled','Active Dataguard not Enabled') active_dg
     ,arch_dest.*
     ,t_param.value
FROM v$archive_dest_status   arch_dest,
     v$parameter             t_param
WHERE t_param.name = 'compatible' 
  AND t_param.value LIKE '1%'
  AND t_param.value NOT like '10%'
  AND arch_dest.recovery_mode LIKE 'MANAGED%' 
  AND arch_dest.STATUS = 'VALID'
 ]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
