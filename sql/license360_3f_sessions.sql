/*****************************************************************************************/
--

DEF title = 'Sessions Aggregate per Type';
DEF main_table = '&&gv_view_prefix.SESSION';
BEGIN
  :sql_text := q'[
SELECT COUNT(*),
       inst_id,
       type,
       server,
       status,
       state
  FROM &&gv_object_prefix.session
 GROUP BY
       inst_id,
       type,
       server,
       status,
       state
 ORDER BY
       1 DESC, 2, 3, 4, 5, 6
]';
  :sql_text_cdb := q'[
SELECT COUNT(*),
       con_id,
       inst_id,
       type,
       server,
       status,
       state
  FROM &&gv_object_prefix.session
 GROUP BY
       con_id,
       inst_id,
       type,
       server,
       status,
       state
 ORDER BY
       1 DESC, 2, 3, 4, 5, 6, 7
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Sessions Aggregate per User and Type';
DEF main_table = '&&gv_view_prefix.SESSION';
BEGIN
  :sql_text := q'[
SELECT COUNT(*),
       username,
       inst_id,
       type,
       server,
       status,
       state
  FROM &&gv_object_prefix.session
 GROUP BY
       username,
       inst_id,
       type,
       server,
       status,
       state
 ORDER BY
       1 DESC, 2, 3, 4, 5, 6, 7
]';
  :sql_text_cdb := q'[
SELECT COUNT(*),
       username,
       con_id,
       inst_id,
       type,
       server,
       status,
       state
  FROM &&gv_object_prefix.session
 GROUP BY
       username,
       con_id,
       inst_id,
       type,
       server,
       status,
       state
 ORDER BY
       1 DESC, 2, 3, 4, 5, 6, 7, 8
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Sessions Aggregate per Module and Action';
DEF main_table = '&&gv_view_prefix.SESSION';
BEGIN
  :sql_text := q'[
SELECT COUNT(*),
       module,
       action,
       inst_id,
       type,
       server,
       status,
       state
  FROM &&gv_object_prefix.session
 GROUP BY
       module,
       action,
       inst_id,
       type,
       server,
       status,
       state
 ORDER BY
       1 DESC, 2, 3, 4, 5, 6, 7, 8
]';
  :sql_text_cdb := q'[
SELECT COUNT(*),
       module,
       action,
       con_id,
       inst_id,
       type,
       server,
       status,
       state
  FROM &&gv_object_prefix.session
 GROUP BY
       module,
       action,
       con_id,
       inst_id,
       type,
       server,
       status,
       state
 ORDER BY
       1 DESC, 2, 3, 4, 5, 6, 7, 8, 9
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Sessions Aggregate per Username and Machine';
DEF main_table = '&&gv_view_prefix.SESSION';
BEGIN
  :sql_text := q'[
SELECT COUNT(*),
       inst_id,
       username,       
       machine
  FROM gv$session
 WHERE username is not null   
 GROUP BY
       inst_id,
       username,       
       machine
 ORDER BY
       1 DESC, 2, 3
]';
  :sql_text_cdb := q'[
SELECT COUNT(*),
       inst_id,
       con_id,
       username,       
       machine
  FROM gv$session
 WHERE username is not null   
 GROUP BY
       inst_id,
       con_id,
       username,       
       machine
 ORDER BY
       1 DESC, 2, 3, 4
]';
END;
/
@@&&9a_pre_one.

/*****************************************************************************************/
--

DEF title = 'Sessions Aggregate per Username, Machine and Program';
DEF main_table = '&&gv_view_prefix.SESSION';
DEF foot = 'Content of &&main_table. is very dynamic. This report just tells state at the time when license360 was executed.';
BEGIN
  :sql_text := q'[
SELECT COUNT(*),
       inst_id,
       username,       
       machine,
       program
  FROM gv$session
 WHERE username is not null
   and not regexp_like(program, '^.*\((P[[:alnum:]]{3})\)$') 
 GROUP BY
       inst_id,
       username,       
       machine,
       program
 ORDER BY
       1 DESC, 2, 3, 4
]';
  :sql_text_cdb := q'[
SELECT COUNT(*),
       inst_id,
       con_id,
       username,       
       machine,
       program
  FROM gv$session
 WHERE username is not null
   and not regexp_like(program, '^.*\((P[[:alnum:]]{3})\)$') 
 GROUP BY
       inst_id,
       con_id,
       username,       
       machine,
       program
 ORDER BY
       1 DESC, 2, 3, 4, 5
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/
--

DEF title = 'Sessions Aggregate per Username, Machine, Program and Service Name';
DEF main_table = '&&gv_view_prefix.SESSION';
DEF foot = 'Content of &&main_table. is very dynamic. This report just tells state at the time when license360 was executed.';
BEGIN
  :sql_text := q'[
SELECT COUNT(*),
       inst_id,
       username,       
       machine,
       program,
       service_name 
  FROM gv$session
 WHERE username is not null
   and not regexp_like(program, '^.*\((P[[:alnum:]]{3})\)$') 
 GROUP BY
       inst_id,
       username,       
       machine,
       program,
       service_name
 ORDER BY
       1 DESC, 2, 3, 4, 5
]';
  :sql_text_cdb := q'[
SELECT COUNT(*),
       inst_id,
       con_id,
       username,       
       machine,
       program,
       service_name
  FROM gv$session
 WHERE username is not null
   and not regexp_like(program, '^.*\((P[[:alnum:]]{3})\)$') 
 GROUP BY
       inst_id,
       con_id,
       username,       
       machine,
       program,
       service_name
 ORDER BY
       1 DESC, 2, 3, 4, 5, 6
]';
END;
/
@@&&9a_pre_one.


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_bch = 'Y';
DEF skip_pch = 'Y';
DEF vaxis = '';
DEF haxis = '';
DEF skip_all = '';
DEF title_suffix = '';
EXEC :sql_text := '';

/*****************************************************************************************/

