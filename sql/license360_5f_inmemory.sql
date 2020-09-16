/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter like 'In-Memory%'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Tables';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TABLES' 'DBA_TABLES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tables
 WHERE inmemory IN ('ENABLED')
 ORDER BY owner,table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tables
 WHERE inmemory IN ('ENABLED')
 ORDER BY con_id, owner,table_name
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Table - Partitions';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TAB_PARTITIONS' 'DBA_TAB_PARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tab_partitions
 WHERE inmemory IN ('ENABLED')
 ORDER BY table_owner,table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_partitions
 WHERE inmemory IN ('ENABLED')
 ORDER BY con_id,table_owner,table_name
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'Table - SubPartitions';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TAB_SUBPARTITIONS' 'DBA_TAB_SUBPARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tab_subpartitions
 WHERE inmemory IN ('ENABLED')
 ORDER BY table_owner,table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_subpartitions
 WHERE inmemory IN ('ENABLED')
 ORDER BY con_id,table_owner,table_name
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'DBA_OBJECT_TABLES';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_OBJECT_TABLES' 'DBA_OBJECT_TABLES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_object_tables
 WHERE inmemory IN ('ENABLED')
 ORDER BY owner,table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_object_tables
 WHERE inmemory IN ('ENABLED')
 ORDER BY con_id,owner,table_name
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'GV$IM_SEGMENTS';
@@&&fc_main_table_name. '&&is_cdb.' 'GV$IM_SEGMENTS' 'GV$IM_SEGMENTS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM GV$IM_SEGMENTS
 ORDER BY inst_id,owner,segment_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM GV$IM_SEGMENTS
 ORDER BY inst_id,owner,segment_name
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Inmemory_Size';
DEF main_table = 'gv$parameter';
BEGIN
  :sql_text := q'[
select inst_id,name, value, display_value, description
  from gv$parameter
  where name = 'inmemory_size'
  order by 1,2
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'In-Memory Aggregation';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_FEATURE_USAGE_STATISTICS' 'DBA_FEATURE_USAGE_STATISTICS'
BEGIN
  :sql_text := q'[
select
       DBID,
       VERSION,
       NAME,
       CURRENTLY_USED,
       FIRST_USAGE_DATE,
       LAST_USAGE_DATE,
       LAST_SAMPLE_DATE
from DBA_FEATURE_USAGE_STATISTICS
where name = 'In-Memory Aggregation'
  order by LAST_SAMPLE_DATE
]';
 :sql_text_cdb := q'[
select
       CON_ID,
       DBID,
       VERSION,
       NAME,
       CURRENTLY_USED,
       FIRST_USAGE_DATE,
       LAST_USAGE_DATE,
       LAST_SAMPLE_DATE
from CDB_FEATURE_USAGE_STATISTICS
where name = 'In-Memory Aggregation'
  order by LAST_SAMPLE_DATE
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
