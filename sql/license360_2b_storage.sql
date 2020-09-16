/*****************************************************************************************/
--Tablespaces

DEF title = 'Tablespaces';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TABLESPACES' 'DBA_TABLESPACES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM &&dva_object_prefix.tablespaces
 ORDER BY
       tablespace_name
]';
  :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM CDB_TABLESPACES
 ORDER BY
       con_id,
       tablespace_name
]';
END;
/
@@&&9a_pre_one.



/*****************************************************************************************/
--Encrypted Tablespaces

DEF title = 'Encrypted Tablespaces';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TABLESPACES' 'DBA_TABLESPACES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM &&dva_object_prefix.tablespaces
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
--Tablespace Usage

DEF title = 'Tablespace Usage';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_SEGMENTS' 'DBA_SEGMENTS'
COL pct_used FOR 999990.0;
BEGIN
  :sql_text := q'[
WITH
files AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       tablespace_name,
       SUM(DECODE(autoextensible, 'YES', maxbytes, bytes)) / POWER(10,9) Max_size_gb,
       SUM( bytes) / POWER(10,9) Size_gb
  FROM &&dva_object_prefix.data_files
 GROUP BY
       tablespace_name
),
segments AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       tablespace_name,
       SUM(bytes) / POWER(10,9) used_gb
  FROM &&dva_object_prefix.segments
 WHERE '&&license360_conf_incl_segments.' = 'Y'
 GROUP BY
       tablespace_name
),
tablespaces AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       files.tablespace_name,
       ROUND(files.size_gb, 1) size_gb,
       ROUND(segments.used_gb, 1) used_gb,
       ROUND(100 * segments.used_gb / files.size_gb, 1) pct_used,
       ROUND(files.max_size_gb, 1) max_size_gb
  FROM files,
       segments
 WHERE files.size_gb > 0
   AND files.tablespace_name = segments.tablespace_name(+)
 ORDER BY
       files.tablespace_name
),
total AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       'Total' tablespace_name,
       SUM(size_gb) size_gb,
       SUM(used_gb) used_gb,
       ROUND(100 * SUM(used_gb) / SUM(size_gb), 1) pct_used,
       sum(max_size_gb) max_size_gb
  FROM tablespaces
)
SELECT tablespace_name,
       size_gb,
       used_gb,
       pct_used,
       max_size_gb
  FROM tablespaces
 UNION ALL
SELECT tablespace_name,
       size_gb,
       used_gb,
       pct_used,
       max_size_gb
  FROM total
]';
  :sql_text_cdb := q'[
WITH
files AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       con_id,
       tablespace_name,
       SUM(DECODE(autoextensible, 'YES', maxbytes, bytes)) / POWER(10,9) Max_size_gb,
       SUM( bytes) / POWER(10,9) Size_gb
  FROM CDB_DATA_FILES
 GROUP BY
       con_id,
       tablespace_name
),
segments AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       con_id,
       tablespace_name,
       SUM(bytes) / POWER(10,9) used_gb
  FROM CDB_SEGMENTS
 WHERE '&&license360_conf_incl_segments.' = 'Y'
 GROUP BY
       con_id,
       tablespace_name
),
tablespaces AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       files.con_id,
       files.tablespace_name,
       ROUND(files.size_gb, 1) size_gb,
       ROUND(segments.used_gb, 1) used_gb,
       ROUND(100 * segments.used_gb / files.size_gb, 1) pct_used,
       ROUND(files.max_size_gb, 1) max_size_gb
  FROM files,
       segments
 WHERE files.size_gb > 0
   AND files.tablespace_name = segments.tablespace_name(+)
   AND files.con_id = segments.con_id(+)
 ORDER BY
       files.tablespace_name
),
total AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       99999 con_id,
       'Total' tablespace_name,
       SUM(size_gb) size_gb,
       SUM(used_gb) used_gb,
       ROUND(100 * SUM(used_gb) / SUM(size_gb), 1) pct_used,
       sum(max_size_gb) max_size_gb
  FROM tablespaces
)
SELECT con_id,
       tablespace_name,
       size_gb,
       used_gb,
       pct_used,
       max_size_gb
  FROM tablespaces
 UNION ALL
SELECT con_id,
       tablespace_name,
       size_gb,
       used_gb,
       pct_used,
       max_size_gb
  FROM total
Order by 1,2,3
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--Temp Tablespace Usage

DEF title = 'Temp Tablespace Usage';
DEF main_table = '&&gv_view_prefix.TEMP_EXTENT_POOL';
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
a.tablespace_name, round(A.AVAIL_SIZE_GB,1) AVAIL_SIZE_GB, 
round(B.TOT_GBBYTES_CACHED,1) TOT_GBBYTES_CACHED , 
round(B.TOT_GBBYTES_USED,1) TOT_GBBYTES_USED,
ROUND(100*(B.TOT_GBBYTES_CACHED/A.AVAIL_SIZE_GB),1) PERC_CACHED,
ROUND(100*(B.TOT_GBBYTES_USED/A.AVAIL_SIZE_GB),1) PERC_USED
FROM
(select  tablespace_name,sum(bytes)/POWER(10,9) AVAIL_SIZE_GB
from &&dva_object_prefix.temp_files
group by tablespace_name) A,
(SELECT tablespace_name, 
SUM(BYTES_CACHED)/POWER(10,9) TOT_GBBYTES_CACHED, 
SUM(BYTES_USED)/POWER(10,9) TOT_GBBYTES_USED
FROM &&gv_object_prefix.temp_extent_pool
GROUP BY  TABLESPACE_NAME) B
where a.tablespace_name=b.tablespace_name
]';
  :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
    a.con_id,
    a.tablespace_name,
    round(a.avail_size_gb,1)avail_size_gb,
    round(b.tot_gbbytes_cached,1)tot_gbbytes_cached,
    round(b.tot_gbbytes_used,1)tot_gbbytes_used,
    round(100 *(b.tot_gbbytes_cached / a.avail_size_gb),1)perc_cached,
    round(100 *(b.tot_gbbytes_used / a.avail_size_gb),1)perc_used
FROM
    (
        SELECT
            con_id,
            tablespace_name,
            SUM(bytes)/ power(10,9)avail_size_gb
        FROM
            cdb_temp_files
        GROUP BY
            con_id,
            tablespace_name
    )a,
    (
        SELECT
            con_id,
            tablespace_name,
            SUM(bytes_cached)/ power(10,9)tot_gbbytes_cached,
            SUM(bytes_used)/ power(10,9)tot_gbbytes_used
        FROM
            gv$temp_extent_pool
        GROUP BY
            con_id,
            tablespace_name
    )b
WHERE a.tablespace_name = b.tablespace_name(+)
  and a.con_id = b.con_id(+)
ORDER BY 1,2  
]';
END;
/
@@&&9a_pre_one.



/*****************************************************************************************/
--Tablespace Quotas

DEF title = 'Tablespace Quotas';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TS_QUOTAS' 'DBA_TS_QUOTAS'
BEGIN
  :sql_text := q'[
select /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */ * from &&dva_object_prefix.ts_quotas
WHERE username NOT IN &&exclusion_list.
and username not in &&exclusion_list2.
]';
  :sql_text_cdb := q'[
select /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */ 
   * 
  from CDB_TS_QUOTAS
 WHERE username NOT IN &&exclusion_list.
   and username not in &&exclusion_list2.
 order by con_id,tablespace_name,username
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--Data Files

DEF title = 'Data Files';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_DATA_FILES' 'DBA_DATA_FILES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM &&dva_object_prefix.data_files
 ORDER BY
       file_name
]';
 :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM CDB_DATA_FILES
 ORDER BY
       con_id,
       file_name
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Data Files Usage';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_DATA_FILES' 'DBA_DATA_FILES'
COL pct_used FOR 999990.0;
COL pct_free FOR 999990.0;
BEGIN
  :sql_text := q'[
WITH
alloc AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       tablespace_name,
       COUNT(*) datafiles,
       ROUND(SUM(bytes)/POWER(10,9)) gb
  FROM &&dva_object_prefix.data_files
 GROUP BY
       tablespace_name
),
free AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       tablespace_name,
       ROUND(SUM(bytes)/POWER(10,9)) gb
  FROM &&dva_object_prefix.free_space
 GROUP BY
       tablespace_name
),
tablespaces AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       a.tablespace_name,
       a.datafiles,
       a.gb alloc_gb,
       (a.gb - f.gb) used_gb,
       f.gb free_gb
  FROM alloc a, free f
 WHERE a.tablespace_name = f.tablespace_name
 ORDER BY
       a.tablespace_name
),
total AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(alloc_gb) alloc_gb,
       SUM(used_gb) used_gb,
       SUM(free_gb) free_gb
  FROM tablespaces
)
SELECT v.tablespace_name,
       v.datafiles,
       v.alloc_gb,
       v.used_gb,
       CASE WHEN v.alloc_gb > 0 THEN
       LPAD(TRIM(TO_CHAR(ROUND(100 * v.used_gb / v.alloc_gb, 1), '990.0')), 8)
       END pct_used,
       v.free_gb,
       CASE WHEN v.alloc_gb > 0 THEN
       LPAD(TRIM(TO_CHAR(ROUND(100 * v.free_gb / v.alloc_gb, 1), '990.0')), 8)
       END pct_free
  FROM (
SELECT tablespace_name,
       datafiles,
       alloc_gb,
       used_gb,
       free_gb
  FROM tablespaces
 UNION ALL
SELECT 'Total' tablespace_name,
       TO_NUMBER(NULL) datafiles,
       alloc_gb,
       used_gb,
       free_gb
  FROM total
) v
]';
  :sql_text_cdb := q'[
WITH
alloc AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       con_id,
       tablespace_name,
       COUNT(*) datafiles,
       ROUND(SUM(bytes)/POWER(10,9)) gb
  FROM CDB_DATA_FILES
 GROUP BY
       con_id,
       tablespace_name
),
free AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       con_id,
       tablespace_name,
       ROUND(SUM(bytes)/POWER(10,9)) gb
  FROM CDB_FREE_SPACE
 GROUP BY
       con_id,
       tablespace_name
),
tablespaces AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       a.con_id,
       a.tablespace_name,
       a.datafiles,
       a.gb alloc_gb,
       (a.gb - f.gb) used_gb,
       f.gb free_gb
  FROM alloc a, free f
 WHERE a.tablespace_name = f.tablespace_name
   AND a.con_id = f.con_id
 ORDER BY
       a.tablespace_name
),
total AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(alloc_gb) alloc_gb,
       SUM(used_gb) used_gb,
       SUM(free_gb) free_gb
  FROM tablespaces
)
SELECT v.con_id,
       v.tablespace_name,
       v.datafiles,
       v.alloc_gb,
       v.used_gb,
       CASE WHEN v.alloc_gb > 0 THEN
       LPAD(TRIM(TO_CHAR(ROUND(100 * v.used_gb / v.alloc_gb, 1), '990.0')), 8)
       END pct_used,
       v.free_gb,
       CASE WHEN v.alloc_gb > 0 THEN
       LPAD(TRIM(TO_CHAR(ROUND(100 * v.free_gb / v.alloc_gb, 1), '990.0')), 8)
       END pct_free
  FROM (
SELECT con_id,
       tablespace_name,
       datafiles,
       alloc_gb,
       used_gb,
       free_gb
  FROM tablespaces
 UNION ALL
SELECT 99999 con_id,
       'Total' tablespace_name,
       TO_NUMBER(NULL) datafiles,
       alloc_gb,
       used_gb,
       free_gb
  FROM total
) v
order by con_id,tablespace_name
]';
END;
/
@@&&9a_pre_one.



/*****************************************************************************************/
--

DEF title = 'Temp Files';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_TEMP_FILES' 'DBA_TEMP_FILES'
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM &&dva_object_prefix.temp_files
 ORDER BY
       file_name
]';
  :sql_text_cdb := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       *
  FROM CDB_TEMP_FILES
 ORDER BY
       con_id,
       file_name
]';
END;
/
@@&&9a_pre_one.



/*****************************************************************************************/
--

DEF title = 'SYSAUX Occupants';
DEF main_table = '&&v_view_prefix.SYSAUX_OCCUPANTS';
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */ 
       v.*, ROUND(v.space_usage_kbytes / POWER(10,6), 3) space_usage_gbs
  FROM &&v_object_prefix.sysaux_occupants v
 ORDER BY 1
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Database Growth per Month';
DEF main_table = '&&v_view_prefix.DATAFILE';
BEGIN
  :sql_text := q'[
SELECT /*+ &&top_level_hints. */ /* &&section_id..&&report_sequence. */
       TO_CHAR(creation_time, 'YYYY-MM') creation_month,
       ROUND(SUM(bytes)/POWER(10,6)) mb_growth,
       ROUND(SUM(bytes)/POWER(10,9)) gb_growth,
       ROUND(SUM(bytes)/POWER(10,12), 1) tb_growth
  FROM &&v_object_prefix.datafile
 GROUP BY
       TO_CHAR(creation_time, 'YYYY-MM')
 ORDER BY
       TO_CHAR(creation_time, 'YYYY-MM')
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Largest 200 Objects';
@@&&fc_main_table_name. '&&is_cdb.' 'CDB_SEGMENTS' 'DBA_SEGMENTS'
COL gb FOR 999990.000;
BEGIN
  :sql_text := q'[
WITH schema_object AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       segment_type,
       owner,
       segment_name,
       tablespace_name,
       COUNT(*) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes
  FROM &&dva_object_prefix.segments
 WHERE '&&license360_conf_incl_segments.' = 'Y'
 GROUP BY
       segment_type,
       owner,
       segment_name,
       tablespace_name
), totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes
  FROM schema_object
), top_200_pre AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       ROWNUM rank, v1.*
       FROM (
SELECT so.segment_type,
       so.owner,
       so.segment_name,
       so.tablespace_name,
       so.segments,
       so.extents,
       so.blocks,
       so.bytes,
       ROUND((so.segments / t.segments) * 100, 3) segments_perc,
       ROUND((so.extents / t.extents) * 100, 3) extents_perc,
       ROUND((so.blocks / t.blocks) * 100, 3) blocks_perc,
       ROUND((so.bytes / t.bytes) * 100, 3) bytes_perc
  FROM schema_object so,
       totals t
 ORDER BY
       bytes_perc DESC NULLS LAST
) v1
 WHERE ROWNUM < 201
), top_200 AS (
SELECT p.*,
       (SELECT object_id
          FROM &&dva_object_prefix.objects o
         WHERE o.object_type = p.segment_type
           AND o.owner = p.owner
           AND o.object_name = p.segment_name
           AND o.object_type NOT LIKE '%PARTITION%') object_id,
       (SELECT data_object_id
          FROM &&dva_object_prefix.objects o
         WHERE o.object_type = p.segment_type
           AND o.owner = p.owner
           AND o.object_name = p.segment_name
           AND o.object_type NOT LIKE '%PARTITION%') data_object_id,
       (SELECT SUM(p2.bytes_perc) FROM top_200_pre p2 WHERE p2.rank <= p.rank) bytes_perc_cum
  FROM top_200_pre p
), top_200_totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes,
       SUM(segments_perc) segments_perc,
       SUM(extents_perc) extents_perc,
       SUM(blocks_perc) blocks_perc,
       SUM(bytes_perc) bytes_perc
  FROM top_200
), top_100_totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes,
       SUM(segments_perc) segments_perc,
       SUM(extents_perc) extents_perc,
       SUM(blocks_perc) blocks_perc,
       SUM(bytes_perc) bytes_perc
  FROM top_200
 WHERE rank < 101
), top_20_totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes,
       SUM(segments_perc) segments_perc,
       SUM(extents_perc) extents_perc,
       SUM(blocks_perc) blocks_perc,
       SUM(bytes_perc) bytes_perc
  FROM top_200
 WHERE rank < 21
)
SELECT v.rank,
       v.segment_type,
       v.owner,
       v.segment_name,
       v.object_id,
       v.data_object_id,
       v.tablespace_name,
       CASE
       WHEN v.segment_type LIKE 'INDEX%' THEN
         (SELECT i.table_name
            FROM &&dva_object_prefix.indexes i
           WHERE i.owner = v.owner AND i.index_name = v.segment_name)       
       WHEN v.segment_type LIKE 'LOB%' THEN
         (SELECT l.table_name
            FROM &&dva_object_prefix.lobs l
           WHERE l.owner = v.owner AND l.segment_name = v.segment_name)
       END table_name,
       v.segments,
       v.extents,
       v.blocks,
       v.bytes,
       ROUND(v.bytes / POWER(10,9), 3) gb,
       LPAD(TO_CHAR(v.segments_perc, '990.000'), 7) segments_perc,
       LPAD(TO_CHAR(v.extents_perc, '990.000'), 7) extents_perc,
       LPAD(TO_CHAR(v.blocks_perc, '990.000'), 7) blocks_perc,
       LPAD(TO_CHAR(v.bytes_perc, '990.000'), 7) bytes_perc,
       LPAD(TO_CHAR(v.bytes_perc_cum, '990.000'), 7) perc_cum
  FROM (
SELECT d.rank,
       d.segment_type,
       d.owner,
       d.segment_name,
       d.object_id,
       d.data_object_id,
       d.tablespace_name,
       d.segments,
       d.extents,
       d.blocks,
       d.bytes,
       d.segments_perc,
       d.extents_perc,
       d.blocks_perc,
       d.bytes_perc,
       d.bytes_perc_cum
  FROM top_200 d
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOP  20' tablespace_name,
       st.segments,
       st.extents,
       st.blocks,
       st.bytes,
       st.segments_perc,
       st.extents_perc,
       st.blocks_perc,
       st.bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM top_20_totals st
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOP 100' tablespace_name,
       st.segments,
       st.extents,
       st.blocks,
       st.bytes,
       st.segments_perc,
       st.extents_perc,
       st.blocks_perc,
       st.bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM top_100_totals st
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOP 200' tablespace_name,
       st.segments,
       st.extents,
       st.blocks,
       st.bytes,
       st.segments_perc,
       st.extents_perc,
       st.blocks_perc,
       st.bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM top_200_totals st
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOTAL' tablespace_name,
       t.segments,
       t.extents,
       t.blocks,
       t.bytes,
       100 segemnts_perc,
       100 extents_perc,
       100 blocks_perc,
       100 bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM totals t) v
]';
  :sql_text_cdb := q'[
WITH schema_object AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       con_id,
       segment_type,
       owner,
       segment_name,
       tablespace_name,
       COUNT(*) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes
  FROM CDB_SEGMENTS
 WHERE '&&license360_conf_incl_segments.' = 'Y'
 GROUP BY
       con_id,
       segment_type,
       owner,
       segment_name,
       tablespace_name
), totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes
  FROM schema_object
), top_200_pre AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       ROWNUM rank, v1.*
       FROM (
SELECT so.con_id,
       so.segment_type,
       so.owner,
       so.segment_name,
       so.tablespace_name,
       so.segments,
       so.extents,
       so.blocks,
       so.bytes,
       ROUND((so.segments / t.segments) * 100, 3) segments_perc,
       ROUND((so.extents / t.extents) * 100, 3) extents_perc,
       ROUND((so.blocks / t.blocks) * 100, 3) blocks_perc,
       ROUND((so.bytes / t.bytes) * 100, 3) bytes_perc
  FROM schema_object so,
       totals t
 ORDER BY
       bytes_perc DESC NULLS LAST
) v1
 WHERE ROWNUM < 201
), top_200 AS (
SELECT p.*,
       (SELECT object_id
          FROM CDB_objects o
         WHERE o.object_type = p.segment_type
           AND o.owner = p.owner
           AND o.object_name = p.segment_name
           AND o.object_type NOT LIKE '%PARTITION%'
           AND o.con_id = p.con_id) object_id,
       (SELECT data_object_id
          FROM CDB_objects o
         WHERE o.object_type = p.segment_type
           AND o.owner = p.owner
           AND o.object_name = p.segment_name
           AND o.object_type NOT LIKE '%PARTITION%'
           AND o.con_id = p.con_id) data_object_id,
       (SELECT SUM(p2.bytes_perc) FROM top_200_pre p2 WHERE p2.rank <= p.rank) bytes_perc_cum
  FROM top_200_pre p
), top_200_totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes,
       SUM(segments_perc) segments_perc,
       SUM(extents_perc) extents_perc,
       SUM(blocks_perc) blocks_perc,
       SUM(bytes_perc) bytes_perc
  FROM top_200
), top_100_totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes,
       SUM(segments_perc) segments_perc,
       SUM(extents_perc) extents_perc,
       SUM(blocks_perc) blocks_perc,
       SUM(bytes_perc) bytes_perc
  FROM top_200
 WHERE rank < 101
), top_20_totals AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       SUM(segments) segments,
       SUM(extents) extents,
       SUM(blocks) blocks,
       SUM(bytes) bytes,
       SUM(segments_perc) segments_perc,
       SUM(extents_perc) extents_perc,
       SUM(blocks_perc) blocks_perc,
       SUM(bytes_perc) bytes_perc
  FROM top_200
 WHERE rank < 21
)
SELECT v.rank,
       v.con_id,
       v.segment_type,
       v.owner,
       v.segment_name,
       v.object_id,
       v.data_object_id,
       v.tablespace_name,
       CASE
       WHEN v.segment_type LIKE 'INDEX%' THEN
         (SELECT i.table_name
            FROM CDB_INDEXES i
           WHERE i.owner = v.owner AND i.index_name = v.segment_name and i.con_id = v.con_id)       
       WHEN v.segment_type LIKE 'LOB%' THEN
         (SELECT l.table_name
            FROM CDB_LOBS l
           WHERE l.owner = v.owner AND l.segment_name = v.segment_name and l.con_id = v.con_id)
       END table_name,
       v.segments,
       v.extents,
       v.blocks,
       v.bytes,
       ROUND(v.bytes / POWER(10,9), 3) gb,
       LPAD(TO_CHAR(v.segments_perc, '990.000'), 7) segments_perc,
       LPAD(TO_CHAR(v.extents_perc, '990.000'), 7) extents_perc,
       LPAD(TO_CHAR(v.blocks_perc, '990.000'), 7) blocks_perc,
       LPAD(TO_CHAR(v.bytes_perc, '990.000'), 7) bytes_perc,
       LPAD(TO_CHAR(v.bytes_perc_cum, '990.000'), 7) perc_cum
  FROM (
SELECT d.rank,
       d.con_id,
       d.segment_type,
       d.owner,
       d.segment_name,
       d.object_id,
       d.data_object_id,
       d.tablespace_name,
       d.segments,
       d.extents,
       d.blocks,
       d.bytes,
       d.segments_perc,
       d.extents_perc,
       d.blocks_perc,
       d.bytes_perc,
       d.bytes_perc_cum
  FROM top_200 d
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       null con_id,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOP  20' tablespace_name,
       st.segments,
       st.extents,
       st.blocks,
       st.bytes,
       st.segments_perc,
       st.extents_perc,
       st.blocks_perc,
       st.bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM top_20_totals st
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       null con_id,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOP 100' tablespace_name,
       st.segments,
       st.extents,
       st.blocks,
       st.bytes,
       st.segments_perc,
       st.extents_perc,
       st.blocks_perc,
       st.bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM top_100_totals st
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       null con_id,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOP 200' tablespace_name,
       st.segments,
       st.extents,
       st.blocks,
       st.bytes,
       st.segments_perc,
       st.extents_perc,
       st.blocks_perc,
       st.bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM top_200_totals st
 UNION ALL
SELECT TO_NUMBER(NULL) rank,
       null con_id,
       NULL segment_type,
       NULL owner,
       NULL segment_name,
       TO_NUMBER(NULL),
       TO_NUMBER(NULL),
       'TOTAL' tablespace_name,
       t.segments,
       t.extents,
       t.blocks,
       t.bytes,
       100 segemnts_perc,
       100 extents_perc,
       100 blocks_perc,
       100 bytes_perc,
       TO_NUMBER(NULL) bytes_perc_cum
  FROM totals t) v
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/


