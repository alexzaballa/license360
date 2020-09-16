-- Put here any customization that you want to load always before starting the sections.
-- Note it will load only once in the beggining.

-- Split due to 200 char limit
DEF default_user_list_1 = "('ANONYMOUS','APEX_040200','APEX_PUBLIC_USER','APPQOSSYS','AUDSYS','CTXSYS','DBSNMP','DIP','DVF','DVSYS','FLOWS_FILES','GSMADMIN_INTERNAL','GSMCATUSER','GSMUSER','LBACSYS','MDDATA','MDSYS','OJVMSYS')";
DEF default_user_list_2 = "('OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','SI_INFORMTN_SCHEMA','SPATIAL_CSW_ADMIN_USR','SPATIAL_WFS_ADMIN_USR','SYS','SYSBACKUP','SYSDG','SYSKM','SYSTEM','WMSYS','XDB','XS$NULL')";
--
DEF exclusion_list = "('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')";
DEF exclusion_list2 = "('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS')";
DEF exclusion_list3 = "('GSMADMIN_INTERNAL','LBACSYS','DVSYS')";
DEF exclusion_list4 = "('AUDSYS')";
--
-- Split due to 200 char limit
DEF default_user_list_11g_1 = "('ANONYMOUS','APEX_030200','APEX_PUBLIC_USER','APPQOSSYS','CTXSYS','DBSNMP','DIP','DVF','DVSYS','EXFSYS','FLOWS_FILES','LBACSYS','MDDATA','MDSYS','MGMT_VIEW','OLAPSYS','ORACLE_OCM')";
DEF default_user_list_11g_2 = "('ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS','OWBSYS_AUDIT','SI_INFORMTN_SCHEMA','SPATIAL_CSW_ADMIN_USR','SPATIAL_WFS_ADMIN_USR','SYS','SYSMAN','SYSTEM','WMSYS','XDB','XS$NULL')";
--
DEF default_user_list_12c_1 = "('ANONYMOUS','APEX_040200','APEX_PUBLIC_USER','APPQOSSYS','AUDSYS','CTXSYS','DBSNMP','DIP','DVF','DVSYS','FLOWS_FILES','GSMADMIN_INTERNAL','GSMCATUSER','GSMUSER','LBACSYS','MDDATA','MDSYS','OJVMSYS')";
DEF default_user_list_12c_2 = "('OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','SI_INFORMTN_SCHEMA','SPATIAL_CSW_ADMIN_USR','SPATIAL_WFS_ADMIN_USR','SYS','SYSBACKUP','SYSDG','SYSKM','SYSTEM','WMSYS','XDB','XS$NULL')";
--
DEF default_role_list_11g_1 = "('ADM_PARALLEL_EXECUTE_TASK','APEX_ADMINISTRATOR_ROLE','AQ_ADMINISTRATOR_ROLE','AQ_USER_ROLE','AUTHENTICATEDUSER','CONNECT','CSW_USR_ROLE','CTXAPP','CWM_USER','DATAPUMP_EXP_FULL_DATABASE')";
DEF default_role_list_11g_2 = "('DATAPUMP_IMP_FULL_DATABASE','DBA','DBFS_ROLE','DELETE_CATALOG_ROLE','DV_ACCTMGR','DV_ADMIN','DV_AUDIT_CLEANUP','DV_GOLDENGATE_ADMIN','DV_GOLDENGATE_REDO_ACCESS','DV_MONITOR','DV_OWNER')";
DEF default_role_list_11g_3 = "('DV_PATCH_ADMIN','DV_PUBLIC','DV_REALM_OWNER','DV_REALM_RESOURCE','DV_SECANALYST','DV_STREAMS_ADMIN','DV_XSTREAM_ADMIN','EJBCLIENT','EXECUTE_CATALOG_ROLE','EXP_FULL_DATABASE')";
DEF default_role_list_11g_4 = "('GATHER_SYSTEM_STATISTICS','GLOBAL_AQ_USER_ROLE','HS_ADMIN_EXECUTE_ROLE','HS_ADMIN_ROLE','HS_ADMIN_SELECT_ROLE','IMP_FULL_DATABASE','JAVADEBUGPRIV','JAVAIDPRIV','JAVASYSPRIV','JAVAUSERPRIV')";
DEF default_role_list_11g_5 = "('JAVA_ADMIN','JAVA_DEPLOY','JMXSERVER','LBAC_DBA','LOGSTDBY_ADMINISTRATOR','MGMT_USER','OEM_ADVISOR','OEM_MONITOR','OLAP_DBA','OLAP_USER','OLAP_XS_ADMIN','ORDADMIN','OWB$CLIENT')";
DEF default_role_list_11g_6 = "('OWB_DESIGNCENTER_VIEW','OWB_USER','RECOVERY_CATALOG_OWNER','RESOURCE','SCHEDULER_ADMIN','SELECT_CATALOG_ROLE','SPATIAL_CSW_ADMIN','SPATIAL_WFS_ADMIN','WFS_USR_ROLE','WM_ADMIN_ROLE','XDBADMIN')";
DEF default_role_list_11g_7 = "('XDB_SET_INVOKER','XDB_WEBSERVICES','XDB_WEBSERVICES_OVER_HTTP','XDB_WEBSERVICES_WITH_PUBLIC')";
DEF default_role_list_11g_8 = "(' ')";
DEF default_role_list_11g_9 = "(' ')";
--
DEF default_role_list_12c_1 = "('ADM_PARALLEL_EXECUTE_TASK','APEX_ADMINISTRATOR_ROLE','APEX_GRANTS_FOR_NEW_USERS_ROLE','AQ_ADMINISTRATOR_ROLE','AQ_USER_ROLE','AUDIT_ADMIN','AUDIT_VIEWER','AUTHENTICATEDUSER','CAPTURE_ADMIN')";
DEF default_role_list_12c_2 = "('CDB_DBA','CONNECT','CSW_USR_ROLE','CTXAPP','DATAPUMP_EXP_FULL_DATABASE','DATAPUMP_IMP_FULL_DATABASE','DBA','DBFS_ROLE','DELETE_CATALOG_ROLE','DV_ACCTMGR','DV_ADMIN','DV_AUDIT_CLEANUP')";
DEF default_role_list_12c_3 = "('DV_DATAPUMP_NETWORK_LINK','DV_GOLDENGATE_ADMIN','DV_GOLDENGATE_REDO_ACCESS','DV_MONITOR','DV_OWNER','DV_PATCH_ADMIN','DV_PUBLIC','DV_REALM_OWNER','DV_REALM_RESOURCE','DV_SECANALYST')";
DEF default_role_list_12c_4 = "('DV_STREAMS_ADMIN','DV_XSTREAM_ADMIN','EJBCLIENT','EM_EXPRESS_ALL','EM_EXPRESS_BASIC','EXECUTE_CATALOG_ROLE','EXP_FULL_DATABASE','GATHER_SYSTEM_STATISTICS','GDS_CATALOG_SELECT')";
DEF default_role_list_12c_5 = "('GLOBAL_AQ_USER_ROLE','GSMADMIN_ROLE','GSMUSER_ROLE','GSM_POOLADMIN_ROLE','HS_ADMIN_EXECUTE_ROLE','HS_ADMIN_ROLE','HS_ADMIN_SELECT_ROLE','IMP_FULL_DATABASE','JAVADEBUGPRIV','JAVAIDPRIV')";
DEF default_role_list_12c_6 = "('JAVASYSPRIV','JAVAUSERPRIV','JAVA_ADMIN','JAVA_DEPLOY','JMXSERVER','LBAC_DBA','LOGSTDBY_ADMINISTRATOR','OEM_ADVISOR','OEM_MONITOR','OLAP_DBA','OLAP_USER','OLAP_XS_ADMIN')";
DEF default_role_list_12c_7 = "('OPTIMIZER_PROCESSING_RATE','ORDADMIN','PDB_DBA','PROVISIONER','RECOVERY_CATALOG_OWNER','RECOVERY_CATALOG_USER','RESOURCE','SCHEDULER_ADMIN','SELECT_CATALOG_ROLE','SPATIAL_CSW_ADMIN')";
DEF default_role_list_12c_8 = "('SPATIAL_WFS_ADMIN','WFS_USR_ROLE','WM_ADMIN_ROLE','XDBADMIN','XDB_SET_INVOKER','XDB_WEBSERVICES','XDB_WEBSERVICES_OVER_HTTP','XDB_WEBSERVICES_WITH_PUBLIC','XS_CACHE_ADMIN','XS_NAMESPACE_ADMIN')";
DEF default_role_list_12c_9 = "('XS_RESOURCE','XS_SESSION_ADMIN')";

@@&&fc_set_value_var_decode. default_user_list_1 &&is_ver_ge_12. 'Y' "&&default_user_list_12c_1." "&&default_user_list_11g_1."
@@&&fc_set_value_var_decode. default_user_list_2 &&is_ver_ge_12. 'Y' "&&default_user_list_12c_2." "&&default_user_list_11g_2."

@@&&fc_set_value_var_decode. default_role_list_1 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_1." "&&default_role_list_11g_1."
@@&&fc_set_value_var_decode. default_role_list_2 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_2." "&&default_role_list_11g_2."
@@&&fc_set_value_var_decode. default_role_list_3 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_3." "&&default_role_list_11g_3."
@@&&fc_set_value_var_decode. default_role_list_4 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_4." "&&default_role_list_11g_4."
@@&&fc_set_value_var_decode. default_role_list_5 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_5." "&&default_role_list_11g_5."
@@&&fc_set_value_var_decode. default_role_list_6 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_6." "&&default_role_list_11g_6."
@@&&fc_set_value_var_decode. default_role_list_7 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_7." "&&default_role_list_11g_7."
@@&&fc_set_value_var_decode. default_role_list_8 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_8." "&&default_role_list_11g_8."
@@&&fc_set_value_var_decode. default_role_list_9 &&is_ver_ge_12. 'Y' "&&default_role_list_12c_9." "&&default_role_list_11g_9."
--

DEF abstract_uom = 'Memory is accounted as power of two (binary) while storage and network traffic as power of ten (decimal). <br />';

DEF skip_html = '';
DEF skip_text = 'Y';
DEF skip_csv = 'Y';
DEF skip_lch = 'Y';
DEF skip_lch2 = 'Y';
DEF skip_pch = 'Y';
DEF skip_bch = 'Y';
DEF skip_all = '';
DEF abstract = '';
DEF abstract2 = '';
DEF foot = '';

DEF skip_all = '';
COL skip_all NEW_V skip_all;

VAR sql_text CLOB;
VAR sql_text_backup CLOB;
VAR sql_text_backup2 CLOB;
VAR sql_text_display CLOB;


-- data dictionary views for tool repository. do not change values. this piece must execute after processing configuration scripts
DEF awr_hist_prefix = 'DBA_HIST_';
DEF awr_object_prefix = 'dba_hist_';
DEF dva_view_prefix = 'DBA_';
DEF dva_object_prefix = 'dba_';
DEF gv_view_prefix = 'GV$';
DEF gv_object_prefix = 'gv$';
DEF v_view_prefix = 'V$';
DEF v_object_prefix = 'v$';
--

DEF top_level_hints = ' NO_MERGE ';
DEF sq_fact_hints = ' MATERIALIZE NO_MERGE ';
DEF ds_hint = ' DYNAMIC_SAMPLING(4) ';
DEF ash_hints1 = ' FULL(h.ash) FULL(h.evt) FULL(h.sn) USE_HASH(h.sn h.ash h.evt) ';
DEF ash_hints2 = ' FULL(h.INT$&&awr_hist_prefix.ACT_SESS_HISTORY.sn) FULL(h.INT$&&awr_hist_prefix.ACT_SESS_HISTORY.ash) FULL(h.INT$&&awr_hist_prefix.ACT_SESS_HISTORY.evt) ';
DEF ash_hints3 = ' USE_HASH(h.INT$&&awr_hist_prefix.ACT_SESS_HISTORY.sn h.INT$&&awr_hist_prefix.ACT_SESS_HISTORY.ash h.INT$&&awr_hist_prefix.ACT_SESS_HISTORY.evt) ';
DEF def_max_rows = '10000';
DEF max_rows = '1e4';
DEF moat369_def_sql_maxrows = '10000';


-- get rdbms version
COL db_version NEW_V db_version;
SELECT version db_version FROM &&v_object_prefix.instance;


-- skip

DEF skip_10g_column = '';
COL skip_10g_column NEW_V skip_10g_column;
DEF skip_10g_script = '';
COL skip_10g_script NEW_V skip_10g_script;
SELECT ' -- skip 10g ' skip_10g_column, ' echo skip 10g ' skip_10g_script FROM &&v_object_prefix.instance WHERE version LIKE '10%';
--
DEF skip_11g_column = '';
COL skip_11g_column NEW_V skip_11g_column;
DEF skip_11g_script = '';
COL skip_11g_script NEW_V skip_11g_script;
SELECT ' -- skip 11g ' skip_11g_column, ' echo skip 11g ' skip_11g_script FROM &&v_object_prefix.instance WHERE version LIKE '11%';
--
DEF skip_11r1_column = '';
COL skip_11r1_column NEW_V skip_11r1_column;
DEF skip_11r1_script = '';
COL skip_11r1_script NEW_V skip_11r1_script;
SELECT ' -- skip 11gR1 ' skip_11r1_column, ' echo skip 11gR1 ' skip_11r1_script FROM &&v_object_prefix.instance WHERE version LIKE '11.1%';
--
DEF skip_non_repo_column = '';
COL skip_non_repo_column NEW_V skip_non_repo_column;
DEF skip_non_repo_script = '';
COL skip_non_repo_script NEW_V skip_non_repo_script;
SELECT ' -- skip non-repository ' skip_non_repo_column, ' echo skip non-repository ' skip_non_repo_script FROM DUAL WHERE '&&tool_repo_user.' IS NOT NULL;
--
DEF skip_12c_column = '';
COL skip_12c_column NEW_V skip_12c_column;
DEF skip_12c_script = '';
COL skip_12c_script NEW_V skip_12c_script;
SELECT ' -- skip 12c ' skip_12c_column, ' echo skip 12c ' skip_12c_script FROM &&v_object_prefix.instance WHERE version LIKE '12%';
--
DEF skip_12r2_column = '';
COL skip_12r2_column NEW_V skip_12r2_column;
DEF skip_12r2_script = '';
COL skip_12r2_script NEW_V skip_12r2_script;
SELECT ' -- skip 12cR2 ' skip_12r2_column, ' echo skip 12cR2 ' skip_12r2_script FROM &&v_object_prefix.instance WHERE version LIKE '12.2%';
--
DEF skip_18c_column = '';
COL skip_18c_column NEW_V skip_18c_column;
DEF skip_18c_script = '';
COL skip_18c_script NEW_V skip_18c_script;
SELECT ' -- skip 18c ' skip_18c_column, ' echo skip 18c ' skip_18c_script FROM &&v_object_prefix.instance WHERE version LIKE '18%';

-- get average number of CPUs
COL avg_cpu_count NEW_V avg_cpu_count FOR A6;
SELECT TO_CHAR(ROUND(AVG(TO_NUMBER(value)),1)) avg_cpu_count FROM &&gv_object_prefix.system_parameter2 WHERE name = 'cpu_count';

-- get total number of CPUs
COL sum_cpu_count NEW_V sum_cpu_count FOR A3;
SELECT TO_CHAR(SUM(TO_NUMBER(value))) sum_cpu_count FROM &&gv_object_prefix.system_parameter2 WHERE name = 'cpu_count';

-- get average number of Cores
COL avg_core_count NEW_V avg_core_count FOR A5;
SELECT TO_CHAR(ROUND(AVG(TO_NUMBER(value)),1)) avg_core_count FROM &&gv_object_prefix.osstat WHERE stat_name = 'NUM_CPU_CORES';

-- get average number of Threads
COL avg_thread_count NEW_V avg_thread_count FOR A6;
SELECT TO_CHAR(ROUND(AVG(TO_NUMBER(value)),1)) avg_thread_count FROM &&gv_object_prefix.osstat WHERE stat_name = 'NUM_CPUS';

-- get CPU Load threshold (for intel assume 1.4x cores and for solaris use 4x cores) else 2x
COL cpu_load_threshold NEW_V cpu_load_threshold FOR A6;
SELECT TO_CHAR(CASE ROUND(AVG(TO_NUMBER(cpus.value))/AVG(TO_NUMBER(cores.value))) WHEN 2 THEN 1.4 * AVG(TO_NUMBER(cores.value)) WHEN 8 THEN 4 * AVG(TO_NUMBER(cores.value)) ELSE 2 * AVG(TO_NUMBER(cores.value)) END) cpu_load_threshold
  FROM &&gv_object_prefix.osstat cores, &&gv_object_prefix.osstat cpus
 WHERE cores.stat_name = 'NUM_CPU_CORES'
   AND cpus.stat_name = 'NUM_CPUS'
/

-- get number of Hosts
COL hosts_count NEW_V hosts_count FOR A2;
SELECT TO_CHAR(COUNT(DISTINCT inst_id)) hosts_count FROM &&gv_object_prefix.osstat WHERE stat_name = 'NUM_CPU_CORES';

-- get cores_threads_hosts
COL cores_threads_hosts NEW_V cores_threads_hosts;
SELECT CASE TO_NUMBER('&&hosts_count.') WHEN 1 THEN 'cores:&&avg_core_count. threads:&&avg_thread_count.' ELSE 'cores:&&avg_core_count.(avg) threads:&&avg_thread_count.(avg) hosts:&&hosts_count.' END cores_threads_hosts FROM DUAL;

-- get block_size
COL database_block_size NEW_V database_block_size;
SELECT TRIM(TO_NUMBER(value)) database_block_size FROM &&v_object_prefix.system_parameter2 WHERE name = 'db_block_size';


-- get dbid
COL license360_dbid NEW_V license360_dbid;
SELECT TRIM(TO_CHAR(dbid)) license360_dbid FROM &&v_object_prefix.database;
--

COL history_days NEW_V history_days;
SELECT 31 history_days FROM DUAL;
SET TERM OFF;

-- snapshot ranges
COL minimum_snap_id NEW_V minimum_snap_id;
SELECT NVL(TO_CHAR(MIN(snap_id)), '0') minimum_snap_id FROM &&awr_object_prefix.snapshot;
COL maximum_snap_id NEW_V maximum_snap_id;
SELECT NVL(TO_CHAR(MAX(snap_id)), '0') maximum_snap_id FROM &&awr_object_prefix.snapshot;
--

COL inst1_present NEW_V inst1_present FOR A1;
COL inst2_present NEW_V inst2_present FOR A1;
COL inst3_present NEW_V inst3_present FOR A1;
COL inst4_present NEW_V inst4_present FOR A1;
COL inst5_present NEW_V inst5_present FOR A1;
COL inst6_present NEW_V inst6_present FOR A1;
COL inst7_present NEW_V inst7_present FOR A1;
COL inst8_present NEW_V inst8_present FOR A1;
COL skip_inst1 NEW_V skip_inst1;
COL skip_inst2 NEW_V skip_inst2;
COL skip_inst3 NEW_V skip_inst3;
COL skip_inst4 NEW_V skip_inst4;
COL skip_inst5 NEW_V skip_inst5;
COL skip_inst6 NEW_V skip_inst6;
COL skip_inst7 NEW_V skip_inst7;
COL skip_inst8 NEW_V skip_inst8;
COL is_single_instance NEW_V is_single_instance FOR A1;

WITH hist AS (
SELECT DISTINCT instance_number
  FROM &&awr_object_prefix.snapshot
WHERE snap_id BETWEEN &&minimum_snap_id. AND &&maximum_snap_id.
   AND dbid = &&license360_dbid.
)
SELECT MAX(CASE instance_number WHEN 1 THEN '1' ELSE NULL END) inst1_present,
       MAX(CASE instance_number WHEN 2 THEN '2' ELSE NULL END) inst2_present,
       MAX(CASE instance_number WHEN 3 THEN '3' ELSE NULL END) inst3_present,
       MAX(CASE instance_number WHEN 4 THEN '4' ELSE NULL END) inst4_present,
       MAX(CASE instance_number WHEN 5 THEN '5' ELSE NULL END) inst5_present,
       MAX(CASE instance_number WHEN 6 THEN '6' ELSE NULL END) inst6_present,
       MAX(CASE instance_number WHEN 7 THEN '7' ELSE NULL END) inst7_present,
       MAX(CASE instance_number WHEN 8 THEN '8' ELSE NULL END) inst8_present,     
       (CASE COUNT(instance_number) WHEN 1 THEN 'Y' ELSE NULL END) is_single_instance
  FROM hist;

SELECT NVL2('&&inst1_present.','','-- skip inst1') skip_inst1,
       NVL2('&&inst2_present.','','-- skip inst2') skip_inst2,
       NVL2('&&inst3_present.','','-- skip inst3') skip_inst3,
       NVL2('&&inst4_present.','','-- skip inst4') skip_inst4,
       NVL2('&&inst5_present.','','-- skip inst5') skip_inst5,
       NVL2('&&inst6_present.','','-- skip inst6') skip_inst6,
       NVL2('&&inst7_present.','','-- skip inst7') skip_inst7,
       NVL2('&&inst8_present.','','-- skip inst8') skip_inst8
  FROM DUAL;
--

DEF skip_10g_column = '';
COL skip_10g_column NEW_V skip_10g_column;
DEF skip_10g_script = '';
COL skip_10g_script NEW_V skip_10g_script;
SELECT ' -- skip 10g ' skip_10g_column, ' echo skip 10g ' skip_10g_script FROM &&v_object_prefix.instance WHERE version LIKE '10%';
--
DEF skip_11g_column = '';
COL skip_11g_column NEW_V skip_11g_column;
DEF skip_11g_script = '';
COL skip_11g_script NEW_V skip_11g_script;
SELECT ' -- skip 11g ' skip_11g_column, ' echo skip 11g ' skip_11g_script FROM &&v_object_prefix.instance WHERE version LIKE '11%';


COL license360_date_from NEW_V license360_date_from;
COL license360_date_to NEW_V license360_date_to;

SELECT TO_CHAR(SYSDATE - 31) license360_date_from FROM DUAL;
SELECT TO_CHAR(SYSDATE) license360_date_to FROM DUAL;

COL between_times NEW_V between_times;
COL between_dates NEW_V between_dates;
SELECT ', between &&license360_date_from. and &&license360_date_to.' between_dates FROM DUAL;
COL tool_sysdate NEW_V tool_sysdate;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') tool_sysdate FROM DUAL;

DEF wait_class_colors = " CASE wait_class WHEN 'ON CPU' THEN '34CF27' WHEN 'Scheduler' THEN '9FFA9D' WHEN 'User I/O' THEN '0252D7' WHEN 'System I/O' THEN '1E96DD' ";
DEF wait_class_colors2 = " WHEN 'Concurrency' THEN '871C12' WHEN 'Application' THEN 'C42A05' WHEN 'Commit' THEN 'EA6A05' WHEN 'Configuration' THEN '594611'  ";
DEF wait_class_colors3 = " WHEN 'Administrative' THEN '75763E'  WHEN 'Network' THEN '989779' WHEN 'Other' THEN 'F571A0' ";
DEF wait_class_colors4 = " WHEN 'Cluster' THEN 'CEC3B5' WHEN 'Queueing' THEN 'C6BAA5' ELSE '000000' END ";


/******************************************************************************/
--At this time, will not run the tool without the Diagnostic Pack

@@&&fc_set_term_off.

@@&&fc_validate_variable. license_pack T_D_N

COL diagnostics_pack NEW_V diagnostics_pack FOR A1
SELECT CASE WHEN '&&license_pack.' IN ('T', 'D') THEN 'Y' ELSE 'N' END diagnostics_pack FROM DUAL;
COL diagnostics_pack clear
COL skip_diagnostics NEW_V skip_diagnostics
SELECT CASE WHEN '&&license_pack.' IN ('T', 'D') THEN NULL ELSE '&&fc_skip_script.' END skip_diagnostics FROM DUAL;
COL skip_diagnostics clear
-- -- -- -- -- --
COL tuning_pack NEW_V tuning_pack FOR A1
SELECT CASE WHEN '&&license_pack.' = 'T' THEN 'Y' ELSE 'N' END tuning_pack FROM DUAL;
COL tuning_pack clear
COL skip_tuning NEW_V skip_tuning
SELECT CASE WHEN '&&license_pack.' = 'T' THEN NULL ELSE '&&fc_skip_script.' END skip_tuning FROM DUAL;
COL skip_tuning clear

--SET TERM ON;
--WHENEVER SQLERROR EXIT SQL.SQLCODE
--SELECT 'At this time, is not possible to run this tool using "N" ' warning FROM dual WHERE '&&license_pack.' = 'N' AND '&moat369_conf_ask_license.' = 'Y';
--BEGIN
--  IF '&&license_pack.' = 'N' AND '&moat369_conf_ask_license.' = 'Y' THEN
--    RAISE_APPLICATION_ERROR(-20000, 'At this time, is not possible to run this tool using "N" ');
--  END IF;
--END;
--/
--WHENEVER SQLERROR CONTINUE;
--@@&&fc_set_term_off.



/******************************************************************************/
--Ask to run FULL or LIGHT

COL skip_ask_run_full NEW_V skip_ask_run_full
 
SELECT CASE WHEN '&license360_param_run_mode.' IS NULL THEN '' ELSE '&&fc_skip_script.' END "skip_ask_run_full"
FROM   DUAL;
COL skip_ask_run_full clear
 
@@&&fc_def_output_file. step_run_full_driver 'step_run_full_driver.sql'
SPO &&step_run_full_driver.
PRO SET TERM ON
PRO ACCEPT license360_param_run_mode char format a1 default 'L' PROMPT "Would you like to run in Full Mode, Light Mode or Extra-Light Mode? [ F | L | E ] - Default (L): "
PRO PRO
PRO @@&&fc_set_term_off.
SPO OFF
 
@&&skip_ask_run_full.&&step_run_full_driver.
UNDEF skip_ask_run_full
HOS rm -f &&step_run_full_driver.
UNDEF step_run_full_driver
 
@@&&fc_validate_variable. license360_param_run_mode RANGE 'F,L,E'

/******************************************************************************/
DEF skip_lic_param_run_light = ''
COL skip_lic_param_run_light new_v skip_lic_param_run_light nopri
DEF skip_lic_param_run_full = ''
COL skip_lic_param_run_full new_v skip_lic_param_run_full nopri


select decode('&&license360_param_run_mode.','E','--','') skip_lic_param_run_light
      ,decode('&&license360_param_run_mode.','E','--','L','--','') skip_lic_param_run_full
from dual;

--

/******************************************************************************/
DEF skip_when_cdb = ''
COL skip_when_cdb new_v skip_when_cdb nopri

select decode('&&is_cdb.','Y','--','') skip_when_cdb
from dual;

--
DEF skip_when_noncdb = ''
COL skip_when_noncdb new_v skip_when_noncdb nopri

select decode('&&is_cdb.','Y','','--') skip_when_noncdb
from dual;

--
DEF license360_dbtype='noncdb';
COL license360_dbtype NEW_V license360_dbtype nopri

SELECT  decode('&&is_cdb.','Y','cdb','noncdb') license360_dbtype
FROM dual;
--

--
DEF license360_username='';
COL license360_username NEW_V license360_username nopri

SELECT user
  FROM dual;
--

DEF skip_when_notsys = ''
COL skip_when_notsys new_v skip_when_notsys nopri

select decode(user,'SYS','','--') skip_when_notsys
from dual;
--
/******************************************************************************/
DEF license360_dbname = ''
COL license360_dbname new_v license360_dbname nopri

select lower(name) license360_dbname from v$database;

/******************************************************************************/
DEF license360_host_name = ''
COL license360_host_name new_v license360_host_name nopri

select host_name license360_host_name from v$instance;

/******************************************************************************/
DEF license360_common_user_prefix = 'C##'
COL license360_common_user_prefix new_v license360_common_user_prefix nopri

select nvl(value,'C##') license360_common_user_prefix from v$parameter where name = 'common_user_prefix';

/******************************************************************************/
DEF license360_dbname_dg = ''
COL license360_dbname_dg new_v license360_dbname_dg nopri

select name license360_dbname_dg from v$database;
/******************************************************************************/

SET TERM OFF
SET VER OFF
SET FEED OFF
SET ECHO OFF
SET TIM OFF
SET TIMI OFF

@@&&skip_lic_param_run_full.license360_get_tablespaces_&&license360_dbtype..sql
@@&&skip_lic_param_run_full.license360_get_users_&&license360_dbtype..sql
@@&&fc_set_term_off.

/******************************************************************************/


/******************************************************************************/

SET TERM OFF
SET VER OFF
SET FEED OFF
SET ECHO OFF
SET TIM OFF
SET TIMI OFF

@@&&skip_lic_param_run_full.quick_db_view.sql
SET HEA OFF TERM OFF;
@@&&fc_set_term_off.

/******************************************************************************/

SET TERM OFF
SET VER OFF
SET FEED OFF
SET ECHO OFF
SET TIM OFF
SET TIMI OFF

@@&&skip_lic_param_run_full.license360_get_dbconf_&&license360_dbtype..sql
@@&&fc_set_term_off.

/******************************************************************************/

@@&&fc_def_output_file. license_step_file 'license_step_file.sql'
@@&&fc_spool_start.
SPO &&license_step_file.
PRO DEF fc_reset_defs_orig = '&&fc_reset_defs.'
PRO DEF fc_reset_defs      = '&&moat369_sw_folder./license360_fc_reset_defs.sql'
PRO SET ARRAY 999
SPO OFF
@@&&fc_spool_end.
@@&&skip_ver_le_12_1.&&skip_ver_ge_18.&&license_step_file.
HOS rm -f &&license_step_file.
UNDEF license_step_file

/******************************************************************************/


