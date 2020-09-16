/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Real Application Testing'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'RAT';
@@&&fc_main_table_name. '&&is_cdb.' 'DUAL' 'DUAL'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       'To be implemented...'
  FROM dual
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       'To be implemented...'
  FROM dual
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
