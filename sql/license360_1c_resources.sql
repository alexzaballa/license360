/*****************************************************************************************/
--CPU Demand Series (Peak) 

DEF main_table = '&&awr_hist_prefix.ACTIVE_SESS_HISTORY';
DEF chartype = 'LineChart';
DEF stacked = '';
DEF vaxis = 'Sessions on CPU or RESMGR';
DEF tit_01 = 'ON CPU + resmgr:cpu quantum';
DEF tit_02 = 'ON CPU';
DEF tit_03 = 'resmgr:cpu quantum';
DEF tit_04 = '';
DEF tit_05 = '';
DEF tit_06 = '';
DEF tit_07 = '';
DEF tit_08 = '';
DEF tit_09 = '';
DEF tit_10 = '';
DEF tit_11 = '';
DEF tit_12 = '';
DEF tit_13 = '';
DEF tit_14 = '';
DEF tit_15 = '';

BEGIN
  :sql_text_backup := q'[
WITH 
cpu_per_inst_and_sample AS (
SELECT /*+ &&sq_fact_hints. &&ds_hint. &&ash_hints1. &&ash_hints2. &&ash_hints3. */ 
       /* &&section_id..&&report_sequence. */
       snap_id,
       instance_number,
       MIN(sample_time) sample_time,
       SUM(CASE session_state WHEN 'ON CPU' THEN 1 ELSE 0 END) on_cpu,
       SUM(CASE event WHEN 'resmgr:cpu quantum' THEN 1 ELSE 0 END) resmgr,
       COUNT(*) on_cpu_and_resmgr
  FROM &&awr_object_prefix.active_sess_history h
 WHERE snap_id BETWEEN &&minimum_snap_id. AND &&maximum_snap_id.
   AND dbid = &&license360_dbid.
   AND instance_number = @instance_number@
   AND (session_state = 'ON CPU' OR event = 'resmgr:cpu quantum')
 GROUP BY
       snap_id,
       instance_number,
       sample_id
),
cpu_per_inst_and_hour AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       snap_id,
       instance_number, 
       MIN(sample_time) min_sample_time, 
       MAX(sample_time) max_sample_time, 
       MAX(on_cpu) on_cpu,
       MAX(resmgr) resmgr,
       MAX(on_cpu_and_resmgr) on_cpu_and_resmgr
  FROM cpu_per_inst_and_sample
 GROUP BY
       snap_id,
       instance_number
)
SELECT snap_id,
       TO_CHAR(MIN(min_sample_time), 'YYYY-MM-DD HH24:MI:SS') begin_time,
       TO_CHAR(MAX(max_sample_time), 'YYYY-MM-DD HH24:MI:SS') end_time,
       SUM(on_cpu_and_resmgr) on_cpu_and_resmgr,
       SUM(on_cpu) on_cpu,
       SUM(resmgr) resmgr,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
  FROM cpu_per_inst_and_hour
 GROUP BY
       snap_id
 ORDER BY
       snap_id
]';
END;
/

DEF vbaseline = ''; 

DEF skip_lch = '';
DEF skip_all = '&&is_single_instance.';
DEF title = 'CPU Demand Series (Peak) for Cluster';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', 'instance_number');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF vbaseline = '';

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 1;
DEF title = 'CPU Demand Series (Peak) for Instance 1';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '1');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 2;
DEF title = 'CPU Demand Series (Peak) for Instance 2';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '2');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 3;
DEF title = 'CPU Demand Series (Peak) for Instance 3';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '3');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 4;
DEF title = 'CPU Demand Series (Peak) for Instance 4';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '4');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 5;
DEF title = 'CPU Demand Series (Peak) for Instance 5';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '5');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 6;
DEF title = 'CPU Demand Series (Peak) for Instance 6';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '6');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 7;
DEF title = 'CPU Demand Series (Peak) for Instance 7';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '7');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 8;
DEF title = 'CPU Demand Series (Peak) for Instance 8';
DEF abstract = 'Number of Sessions demanding CPU. Based on peak demand per hour.<br />'
DEF foot = 'Sessions "ON CPU" or "ON CPU" + "resmgr:cpu quantum"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '8');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';


/*****************************************************************************************/
--CPU Demand Series (Percentile)

DEF main_table = '&&awr_hist_prefix.ACTIVE_SESS_HISTORY';
DEF chartype = 'LineChart';
DEF stacked = '';
DEF vaxis = 'Sessions on CPU';
DEF tit_01 = 'Maximum (Peak)';
DEF tit_02 = '99th Percentile';
DEF tit_03 = '97th Percentile';
DEF tit_04 = '95th Percentile';
DEF tit_05 = '90th Percentile';
DEF tit_06 = '75th Percentile';
DEF tit_07 = 'Median';
DEF tit_08 = 'Average';
DEF tit_09 = '';
DEF tit_10 = '';
DEF tit_11 = '';
DEF tit_12 = '';
DEF tit_13 = '';
DEF tit_14 = '';
DEF tit_15 = '';

BEGIN
  :sql_text_backup := q'[
WITH 
cpu_per_inst_and_sample AS (
SELECT /*+ &&sq_fact_hints. &&ds_hint. &&ash_hints1. &&ash_hints2. &&ash_hints3. */ 
       /* &&section_id..&&report_sequence. */
       snap_id,
       instance_number,
       MIN(sample_time) sample_time,
       COUNT(*) on_cpu
  FROM &&awr_object_prefix.active_sess_history h
 WHERE snap_id BETWEEN &&minimum_snap_id. AND &&maximum_snap_id.
   AND dbid = &&license360_dbid.
   AND instance_number = @instance_number@
   AND session_state = 'ON CPU'
 GROUP BY
       snap_id,
       instance_number,
       sample_id
),
cpu_per_inst_and_hour AS (
SELECT /*+ &&sq_fact_hints. */ /* &&section_id..&&report_sequence. */
       snap_id,
       instance_number, 
       MIN(sample_time) min_sample_time, 
       MAX(sample_time) max_sample_time, 
       MAX(on_cpu)                                          on_cpu_max,
       PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY on_cpu) on_cpu_99p,
       PERCENTILE_DISC(0.97) WITHIN GROUP (ORDER BY on_cpu) on_cpu_97p,
       PERCENTILE_DISC(0.95) WITHIN GROUP (ORDER BY on_cpu) on_cpu_95p,
       PERCENTILE_DISC(0.90) WITHIN GROUP (ORDER BY on_cpu) on_cpu_90p,
       PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY on_cpu) on_cpu_75p,
       ROUND(MEDIAN(on_cpu), 1)                             on_cpu_med,
       ROUND(AVG(on_cpu), 1)                                on_cpu_avg
  FROM cpu_per_inst_and_sample
 GROUP BY
       snap_id,
       instance_number
)
SELECT snap_id,
       TO_CHAR(MIN(min_sample_time), 'YYYY-MM-DD HH24:MI:SS') begin_time,
       TO_CHAR(MAX(max_sample_time), 'YYYY-MM-DD HH24:MI:SS') end_time,
       SUM(on_cpu_max) on_cpu_max,
       SUM(on_cpu_99p) on_cpu_99p,
       SUM(on_cpu_97p) on_cpu_97p,
       SUM(on_cpu_95p) on_cpu_95p,
       SUM(on_cpu_90p) on_cpu_90p,
       SUM(on_cpu_75p) on_cpu_75p,
       SUM(on_cpu_med) on_cpu_med,
       SUM(on_cpu_avg) on_cpu_avg,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
  FROM cpu_per_inst_and_hour
 GROUP BY
       snap_id
 ORDER BY
       snap_id
]';
END;
/

DEF vbaseline = ''; 

DEF skip_lch = '';
DEF skip_all = '&&is_single_instance.';
DEF title = 'CPU Demand Series (Percentile) for Cluster';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', 'instance_number');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF vbaseline = '';

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 1;
DEF title = 'CPU Demand Series (Percentile) for Instance 1';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '1');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 2;
DEF title = 'CPU Demand Series (Percentile) for Instance 2';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '2');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 3;
DEF title = 'CPU Demand Series (Percentile) for Instance 3';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '3');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 4;
DEF title = 'CPU Demand Series (Percentile) for Instance 4';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '4');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 5;
DEF title = 'CPU Demand Series (Percentile) for Instance 5';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '5');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 6;
DEF title = 'CPU Demand Series (Percentile) for Instance 6';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '6');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 7;
DEF title = 'CPU Demand Series (Percentile) for Instance 7';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '7');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF skip_lch = '';
DEF skip_all = 'Y';
SELECT NULL skip_all FROM &&gv_object_prefix.instance WHERE instance_number = 8;
DEF title = 'CPU Demand Series (Percentile) for Instance 8';
DEF abstract = 'Number of Sessions demanding CPU. Based on percentiles per hour as per Active Session History (ASH).<br />'
DEF foot = 'Sessions "ON CPU"'
EXEC :sql_text := REPLACE(:sql_text_backup, '@instance_number@', '8');
@@&&skip_all.&&skip_diagnostics.&&9a_pre_one.

DEF vbaseline = ''; 

/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';
