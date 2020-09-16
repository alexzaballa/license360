/*****************************************************************************************/

DEF title = 'Redaction Policies';
@@&&fc_main_table_name. '&&is_cdb.' 'REDACTION_POLICIES' 'REDACTION_POLICIES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM redaction_policies
 ORDER BY object_owner, object_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM redaction_policies
 ORDER BY object_owner, object_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'Column Encryption';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_ENCRYPTED_COLUMNS' 'DBA_ENCRYPTED_COLUMNS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM dba_encrypted_columns
 ORDER BY owner, table_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */
       *
  FROM cdb_encrypted_columns
 ORDER BY con_id, owner, table_name
]';
END;
/
@@&&skip_10g_script.&&skip_11r1_script.&&9a_pre_one. 


/*****************************************************************************************/
--Encrypted Tablespaces

DEF title = 'Tablespace Encryption';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TABLESPACES' 'DBA_TABLESPACES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM dba_tablespaces
 where encrypted != 'NO'
 ORDER BY
       tablespace_name
]';
  :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM CDB_TABLESPACES
 where encrypted != 'NO'
 ORDER BY
       con_id,
       tablespace_name
]';
END;
/
@@&&skip_ver_le_10.&&9a_pre_one.


/*****************************************************************************************/

DEF title = 'Securefiles Encryption - DBA_LOBS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_LOBS' 'DBA_LOBS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM DBA_LOBS
 where encrypt not in ('NO', 'NONE')
 ORDER BY
       owner,table_name
]';
  :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM CDB_LOBS
 where encrypt not in ('NO', 'NONE')
 ORDER BY
       con_id,
       owner,table_name
]';
END;
/
@@&&skip_ver_le_10.&&9a_pre_one.


/*****************************************************************************************/

DEF title = 'Securefiles Encryption - DBA_LOB_PARTITIONS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_LOB_PARTITIONS' 'DBA_LOB_PARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM DBA_LOB_PARTITIONS
 where encrypt not in ('NO', 'NONE')
 ORDER BY
       table_owner,table_name
]';
  :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM CDB_LOB_PARTITIONS
 where encrypt not in ('NO', 'NONE')
 ORDER BY
       con_id,
       table_owner,table_name
]';
END;
/
@@&&skip_ver_le_10.&&9a_pre_one.


/*****************************************************************************************/

DEF title = 'Securefiles Encryption - DBA_LOB_SUBPARTITIONS';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_LOB_SUBPARTITIONS' 'DBA_LOB_SUBPARTITIONS'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM DBA_LOB_SUBPARTITIONS
 where encrypt not in ('NO', 'NONE')
 ORDER BY
       table_owner,table_name
]';
  :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM CDB_LOB_SUBPARTITIONS
 where encrypt not in ('NO', 'NONE')
 ORDER BY
       con_id,
       table_owner,table_name
]';
END;
/
@@&&skip_ver_le_10.&&9a_pre_one.


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
