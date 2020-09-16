/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Oracle Database Vault'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Status - DV_STATUS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_DV_STATUS' 'DBA_DV_STATUS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM DBA_DV_STATUS
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM CDB_DV_STATUS
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'DVF';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_USERS' 'DBA_USERS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_users
 WHERE username like '%DVF%'
 ORDER BY username
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_users
 WHERE username like '%DVF%'
 ORDER BY con_id, username
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'DVSYS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_USERS' 'DBA_USERS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_users
 WHERE username like '%DVSYS%'
 ORDER BY username
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_users
 WHERE username like '%DVSYS%'
 ORDER BY con_id, username
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'LBACSYS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_USERS' 'DBA_USERS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_users
 WHERE username like '%LBACSYS%'
 ORDER BY username
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_users
 WHERE username like '%LBACSYS%'
 ORDER BY con_id, username
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'DBA_DV_REALM';
@@&&fc_main_table_name. '&&is_cdb.' 'DBA_DV_REALM' 'DBA_DV_REALM'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_dv_realm
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_dv_realm
]';
END;
/
@@&&9a_pre_one. 



/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
