/*****************************************************************************************/

DEF title = 'Status - V$OPTION';
DEF main_table = 'v$option';
BEGIN
  :sql_text := q'[
SELECT *
  FROM v$option
 WHERE parameter = 'OLAP'
]';
END;
/
@@&&9a_pre_one. 

/*****************************************************************************************/

DEF title = 'OLAP - Analytic Workspaces';
DEF main_table = 'dba_aws';
BEGIN
  :sql_text := q'[
SELECT 
       *
FROM
    dba_aws
WHERE
    aw_number >= 1000 and
owner NOT IN (
    'DM',
    'OLAPTRAIN',
    'GLOBAL',
    'HR',
    'OE',
    'PM',
    'SH',
    'IX',
    'BI',
    'SCOTT'
)
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF title = 'OLAP - Cubes';
DEF main_table = 'dba_olap2_cubes';
BEGIN
  :sql_text := q'[
SELECT 
       *
  FROM dba_olap2_cubes
]';
END;
/
@@&&9a_pre_one. 


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
