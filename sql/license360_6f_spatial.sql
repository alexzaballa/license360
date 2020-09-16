/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Spatial'
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'SDO_GEOM_METADATA_TABLE';
DEF main_table = 'MDSYS.SDO_GEOM_METADATA_TABLE';
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM MDSYS.SDO_GEOM_METADATA_TABLE
]';
END;
/
@@&&9a_pre_one. 


DEF title = 'SDO_FEATURE_USAGE';
DEF main_table = 'MDSYS.SDO_FEATURE_USAGE';
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM MDSYS.SDO_FEATURE_USAGE
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
