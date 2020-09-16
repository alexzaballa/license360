/*****************************************************************************************/

DEF title = 'Tables set for Compression';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TABLES' 'DBA_TABLES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tables
 WHERE owner NOT IN &&exclusion_list.
   AND owner NOT IN &&exclusion_list2.
   AND owner NOT IN &&exclusion_list3.
   AND owner NOT IN &&exclusion_list4.
   AND compression = 'ENABLED'
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tables
 WHERE owner NOT IN &&exclusion_list.
   AND owner NOT IN &&exclusion_list2.
   AND owner NOT IN &&exclusion_list3.
   AND owner NOT IN &&exclusion_list4.
   AND compression = 'ENABLED'
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
 WHERE table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.
   AND compression = 'ENABLED'
 ORDER BY table_owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_partitions
 WHERE table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.
   AND compression = 'ENABLED'
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
 WHERE table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.
   AND compression = 'ENABLED'
 ORDER BY table_owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_subpartitions
 WHERE table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.
   AND compression = 'ENABLED'
 ORDER BY con_id, table_owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 

*****************************************************************************************/
--

DEF title = 'Indexes set for Compression';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_INDEXES' 'DBA_INDEXES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_indexes
 WHERE owner NOT IN &&exclusion_list.
   AND owner NOT IN &&exclusion_list2.
   AND owner NOT IN &&exclusion_list3.
   AND owner NOT IN &&exclusion_list4.
   AND compression <> 'DISABLED'
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_indexes
 WHERE owner NOT IN &&exclusion_list.
   AND owner NOT IN &&exclusion_list2.
   AND owner NOT IN &&exclusion_list3.
   AND owner NOT IN &&exclusion_list4.
   AND compression <> 'DISABLED'
 ORDER BY con_id, owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Materialized Views';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_MVIEWS' 'DBA_MVIEWS'
BEGIN
  :sql_text := '
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_mviews
 ORDER BY owner, mview_name
';
 :sql_text_cdb := '
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_mviews
 ORDER BY con_id, owner, mview_name
'; 
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'Materialized Views using Database Links';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_MVIEWS' 'DBA_MVIEWS'
BEGIN
  :sql_text := '
select *
from   dba_mviews 
where  master_link is not null
order by 1,2
';
 :sql_text_cdb := '
select *
from   cdb_mviews 
where  master_link is not null
order by 1,2
';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/
--

DEF title = 'Database and Schema Triggers';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TRIGGERS' 'DBA_TRIGGERS'
BEGIN
  :sql_text := q'[
SELECT *
  FROM &&dva_object_prefix.triggers
 WHERE base_object_type IN ('DATABASE', 'SCHEMA')
 ORDER BY
       base_object_type, owner, trigger_name
]';
  :sql_text_cdb := q'[
SELECT *
  FROM CDB_TRIGGERS
 WHERE base_object_type IN ('DATABASE', 'SCHEMA')
 ORDER BY
       con_id, base_object_type, owner, trigger_name
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Logon Triggers';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TRIGGERS' 'DBA_TRIGGERS'
BEGIN
  :sql_text := q'[
select * 
 from dba_triggers 
where triggering_event like 'LOG%'
  and status = 'ENABLED'
 order by 1,2   
]';
 :sql_text_cdb := q'[
select * 
 from cdb_triggers 
where triggering_event like 'LOG%'
  and status = 'ENABLED'
 order by 1,2   
 ]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
