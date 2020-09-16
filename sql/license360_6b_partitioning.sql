/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'Partitioning'
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
 WHERE partitioned <> 'NO'
   AND owner NOT IN &&exclusion_list.
   AND owner NOT IN &&exclusion_list2.
   AND owner NOT IN &&exclusion_list3.
   AND owner NOT IN &&exclusion_list4. 
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tables
 WHERE partitioned <> 'NO'
   AND owner NOT IN &&exclusion_list.
   AND owner NOT IN &&exclusion_list2. 
   AND owner NOT IN &&exclusion_list3.
   AND owner NOT IN &&exclusion_list4. 
 ORDER BY con_id, owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'Table - Partitions';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TAB_PARTITIONS' 'DBA_TAB_PARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tab_partitions
 WHERE 1=1
   AND table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.   
 ORDER BY table_owner, table_name, partition_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_partitions
 WHERE 1=1
   AND table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.   
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.   
 ORDER BY con_id, table_owner, table_name, partition_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/
--

DEF title = 'Table - Subpartitions';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TAB_SUBPARTITIONS' 'DBA_TAB_SUBPARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_tab_subpartitions
 WHERE 1=1
   AND table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.        
 ORDER BY table_owner, table_name, partition_name, subpartition_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_tab_subpartitions
 WHERE 1=1
   AND table_owner NOT IN &&exclusion_list.
   AND table_owner NOT IN &&exclusion_list2.     
   AND table_owner NOT IN &&exclusion_list3.
   AND table_owner NOT IN &&exclusion_list4.   
 ORDER BY con_id, table_owner, table_name, partition_name, subpartition_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/
--

DEF title = 'Indexes';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_INDEXES' 'DBA_INDEXES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_indexes
 WHERE partitioned <> 'NO'
    AND owner NOT IN &&exclusion_list.
    AND owner NOT IN &&exclusion_list2.
    AND owner NOT IN &&exclusion_list3.
    AND owner NOT IN &&exclusion_list4.
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_indexes
 WHERE partitioned <> 'NO'
   AND owner NOT IN &&exclusion_list.
   AND owner NOT IN &&exclusion_list2.
   AND owner NOT IN &&exclusion_list3.
   AND owner NOT IN &&exclusion_list4.
 ORDER BY con_id, owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/
--

DEF title = 'Index - Partitions';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_IND_PARTITIONS' 'DBA_IND_PARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_ind_partitions
 WHERE 1=1
   AND index_owner NOT IN &&exclusion_list.
   AND index_owner NOT IN &&exclusion_list2.
   AND index_owner NOT IN &&exclusion_list3.
   AND index_owner NOT IN &&exclusion_list4. 
 ORDER BY index_owner, index_name, partition_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_ind_partitions
 WHERE 1=1
   AND index_owner NOT IN &&exclusion_list.
   AND index_owner NOT IN &&exclusion_list2. 
   AND index_owner NOT IN &&exclusion_list3. 
   AND index_owner NOT IN &&exclusion_list4. 
 ORDER BY con_id, index_owner, index_name, partition_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 

/*****************************************************************************************/
--

DEF title = 'Index - SubPartitions';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_IND_SUBPARTITIONS' 'DBA_IND_SUBPARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_ind_subpartitions
 WHERE 1=1
   AND index_owner NOT IN &&exclusion_list.
   AND index_owner NOT IN &&exclusion_list2.
   AND index_owner NOT IN &&exclusion_list3.
   AND index_owner NOT IN &&exclusion_list4.   
 ORDER BY index_owner, index_name, partition_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_ind_subpartitions
 WHERE 1=1
   AND index_owner NOT IN &&exclusion_list.
   AND index_owner NOT IN &&exclusion_list2.
   AND index_owner NOT IN &&exclusion_list3.   
   AND index_owner NOT IN &&exclusion_list4.      
 ORDER BY con_id, index_owner, index_name, partition_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 

/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
