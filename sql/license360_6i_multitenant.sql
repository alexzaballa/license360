/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$database';

BEGIN
  :sql_text := q'[
select decode(CDB,'YES','Multitenat Database is Enabled','Multitenat Database is NOT Enabled')  IsMultitenant
      ,(select count(*) from v$pdbs where con_id > 2) pdbs
      ,(select value from v$parameter where name = 'enable_pluggable_database') enable_pluggable_database
  from v$database
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
