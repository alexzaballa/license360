/*****************************************************************************************/

DEF title = 'Tables set for Compression';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TABLES' 'DBA_TABLES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tables
 WHERE compress_for IN ('FOR ALL OPERATIONS', 'OLTP', 'ADVANCED')
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tables
 WHERE compress_for IN ('FOR ALL OPERATIONS', 'OLTP', 'ADVANCED')
 ORDER BY con_id, owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Partitions set for Compression';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TAB_PARTITIONS' 'DBA_TAB_PARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tab_partitions
 WHERE compress_for IN ('FOR ALL OPERATIONS', 'OLTP', 'ADVANCED')
 ORDER BY table_owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_partitions
 WHERE compress_for IN ('FOR ALL OPERATIONS', 'OLTP', 'ADVANCED')
 ORDER BY con_id, table_owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/
--

DEF title = 'Subpartitions set for Compression';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TAB_SUBPARTITIONS' 'DBA_TAB_SUBPARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tab_subpartitions
 WHERE compress_for IN ('FOR ALL OPERATIONS', 'OLTP', 'ADVANCED')
 ORDER BY table_owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_subpartitions
 WHERE compress_for IN ('FOR ALL OPERATIONS', 'OLTP', 'ADVANCED')
 ORDER BY con_id, table_owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/
--

DEF title = 'Indexes set for Compression';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_INDEXES' 'DBA_INDEXES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_indexes
 WHERE compression LIKE '%ADVANCED%'
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_indexes
 WHERE compression LIKE '%ADVANCED%'
 ORDER BY con_id, owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'Securefiles Compression and Deduplication - DBA_LOBS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_LOBS' 'DBA_LOBS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_lobs
 WHERE (compression NOT IN ('NO', 'NONE')
         OR deduplication   NOT IN ('NO', 'NONE'))
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_lobs
 WHERE (compression NOT IN ('NO', 'NONE')
         OR deduplication   NOT IN ('NO', 'NONE'))
 ORDER BY con_id, owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'Securefiles Compression and Deduplication - DBA_LOB_PARTITIONS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_LOB_PARTITIONS' 'DBA_LOB_PARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_lob_partitions  
 WHERE (compression NOT IN ('NO', 'NONE')
         OR deduplication   NOT IN ('NO', 'NONE'))
 ORDER BY table_owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_lob_partitions
 WHERE (compression NOT IN ('NO', 'NONE')
         OR deduplication   NOT IN ('NO', 'NONE'))
 ORDER BY con_id, table_owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'Securefiles Compression and Deduplication - DBA_LOB_SUBPARTITIONS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_LOB_SUBPARTITIONS' 'DBA_LOB_SUBPARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_lob_subpartitions  
 WHERE (compression NOT IN ('NO', 'NONE')
         OR deduplication   NOT IN ('NO', 'NONE'))
 ORDER BY table_owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_lob_subpartitions
 WHERE (compression NOT IN ('NO', 'NONE')
         OR deduplication   NOT IN ('NO', 'NONE'))
 ORDER BY con_id, table_owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'DBA_FLASHBACK_ARCHIVE';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_FLASHBACK_ARCHIVE' 'DBA_FLASHBACK_ARCHIVE'
BEGIN
  :sql_text := q'[
SELECT dba_f.FLASHBACK_ARCHIVE_NAME,
       dba_ts.TABLESPACE_NAME,
       dba_ts.QUOTA_IN_MB,
       dba_f.RETENTION_IN_DAYS,
       dba_f.CREATE_TIME,
       dba_f.LAST_PURGE_TIME,
       dba_f.STATUS
  FROM DBA_FLASHBACK_ARCHIVE dba_f
      ,DBA_FLASHBACK_ARCHIVE_TS dba_ts 
 WHERE dba_f.FLASHBACK_ARCHIVE# = dba_ts.FLASHBACK_ARCHIVE#
 ORDER BY dba_f.owner_name, dba_f.FLASHBACK_ARCHIVE_NAME
 ]';
  :sql_text_cdb := q'[
SELECT dba_f.FLASHBACK_ARCHIVE_NAME,
       dba_ts.TABLESPACE_NAME,
       dba_ts.QUOTA_IN_MB,
       dba_f.RETENTION_IN_DAYS,
       dba_f.CREATE_TIME,
       dba_f.LAST_PURGE_TIME,
       dba_f.STATUS
  FROM CDB_FLASHBACK_ARCHIVE dba_f
      ,CDB_FLASHBACK_ARCHIVE_TS dba_ts 
 WHERE dba_f.FLASHBACK_ARCHIVE# = dba_ts.FLASHBACK_ARCHIVE#
   AND dba_f.CON_ID = dba_ts.CON_ID
 ORDER BY dba_f.owner_name, dba_f.FLASHBACK_ARCHIVE_NAME
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'DBA_FLASHBACK_ARCHIVE_TABLES';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_FLASHBACK_ARCHIVE_TABLES' 'DBA_FLASHBACK_ARCHIVE_TABLES'
BEGIN
  :sql_text := q'[
SELECT *
  FROM DBA_FLASHBACK_ARCHIVE_TABLES
 ORDER BY owner_name, table_name
 ]';
  :sql_text_cdb := q'[
SELECT *
  FROM CDB_FLASHBACK_ARCHIVE_TABLES
 ORDER BY con_id,owner_name, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'Data Guard - Compression';
DEF main_table = 'gv$parameter;
BEGIN
  :sql_text := q'[
select inst_id,name NAME_, value as value_, isdefault
  from GV$PARAMETER
  where UPPER(name)  like '%LOG_ARCHIVE_DEST%'
    and UPPER(value) like '%COMPRESSION=ENABLE%'
  order by 1,2
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Data Pump - Compression';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_FEATURE_USAGE_STATISTICS' 'DBA_FEATURE_USAGE_STATISTICS'
BEGIN
  :sql_text := q'[
select
       VERSION,
       NAME,
       CURRENTLY_USED,
       LAST_USAGE_DATE,
       LAST_SAMPLE_DATE,
       to_char(FEATURE_INFO) feature_info_
from dba_feature_usage_statistics
where name = 'Oracle Utility Datapump (Export)'
  order by 1, 2
 ]';
  :sql_text_cdb := q'[
select
       CON_ID,
       VERSION,
       NAME,
       CURRENTLY_USED,
       LAST_USAGE_DATE,
       LAST_SAMPLE_DATE,
       to_char(FEATURE_INFO) feature_info_
from cdb_feature_usage_statistics
where name = 'Oracle Utility Datapump (Export)'
  order by 1, 2, 3
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
