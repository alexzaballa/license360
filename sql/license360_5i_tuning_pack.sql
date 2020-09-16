/*****************************************************************************************/

DEF title = 'SQL Profiles';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_SQL_PROFILES' 'DBA_SQL_PROFILES'
BEGIN
  :sql_text := q'[
select *
  from DBA_SQL_PROFILES
  where lower(STATUS) = 'enabled'
]';
 :sql_text_cdb := q'[
select *
  from CDB_SQL_PROFILES
  where lower(STATUS) = 'enabled'
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'SQL Access Advisor/Tuning Advisor';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_ADVISOR_TASKS' 'DBA_ADVISOR_TASKS'
BEGIN
  :sql_text := q'[
select
    *
  from DBA_ADVISOR_TASKS
  where ADVISOR_NAME in ('SQL Tuning Advisor', 'SQL Access Advisor')
    and not (OWNER='SYS' and TASK_NAME='SYS_AUTO_SQL_TUNING_TASK' and DESCRIPTION='Automatic SQL Tuning Task')
    and not (OWNER='SYS' and TASK_NAME='SYS_AUTO_INDEX_TASK')
  order by CREATED
]';
 :sql_text_cdb := q'[
select
    *
  from CDB_ADVISOR_TASKS
  where ADVISOR_NAME in ('SQL Tuning Advisor', 'SQL Access Advisor')
    and not (OWNER='SYS' and TASK_NAME='SYS_AUTO_SQL_TUNING_TASK' and DESCRIPTION='Automatic SQL Tuning Task')
    and not (OWNER='SYS' and TASK_NAME='SYS_AUTO_INDEX_TASK')
  order by CREATED
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'SQL Tuning Sets';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_SQLSET' 'DBA_SQLSET'
BEGIN
  :sql_text := q'[
select
      *
  from DBA_SQLSET
 where name <> 'SYS_AUTO_STS' 
  order by ID
]';
 :sql_text_cdb := q'[
select
      *
  from CDB_SQLSET
 where name <> 'SYS_AUTO_STS' 
  order by ID
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'SQL Tuning Sets Preferences';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_SQLSET_REFERENCES' 'DBA_SQLSET_REFERENCES'
BEGIN
  :sql_text := q'[
select
      *
  from DBA_SQLSET_REFERENCES
  order by SQLSET_ID, OWNER, DESCRIPTION, ID
]';
 :sql_text_cdb := q'[
select
      *
  from CDB_SQLSET_REFERENCES
  order by SQLSET_ID, OWNER, DESCRIPTION, ID
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
