/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Data Mining'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'DBA_MINING_MODELS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_MINING_MODELS' 'DBA_MINING_MODELS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       '*'
  FROM DBA_MINING_MODELS
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       '*'
  FROM CDB_MINING_MODELS
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/


--SELECT count(*) FROM ODM.ODM_MINING_MODEL;

--SELECT count(*) FROM DMSYS.DM$OBJECT;

--SELECT count(*) FROM DMSYS.DM$MODEL;

--SELECT count(*) FROM DMSYS.DM$P_MODEL;

--SELECT count(*) FROM SYS.MODEL$;