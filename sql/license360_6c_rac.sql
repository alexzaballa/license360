/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Real Application Clusters'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Cluster Database';
DEF main_table = 'v$parameter';

BEGIN

  :sql_text := q'[
select decode(value,'TRUE','RAC is Enabled','RAC is not Enabled') RAC_ENABLED,
       name,
       value,
       (select count(*) from gv$instance) nodes,
       (select sum(cpu_count_current) from gv$license) cpu_count_current, 
       (select round(stddev(cpu_count_current),1) from gv$license) cpu_stddev_current 
  from v$system_parameter
 where name='cluster_database'
]';

END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
