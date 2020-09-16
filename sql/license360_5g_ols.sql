/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Oracle Label Security'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Status- DBA_OLS_STATUS';
@@&&fc_main_table_name. '&&is_cdb.' 'cdb_ols_status' 'dba_ols_status'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_ols_status
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_ols_status
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'OLS$POL';
DEF main_table = 'LBACSYS.OLS$POL';
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM LBACSYS.OLS$POL
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
