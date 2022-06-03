/*****************************************************************************************/

DEF title = 'Secure Backup';
DEF main_table = 'gv$backup_piece';
BEGIN
  :sql_text := q'[
SELECT
    decode(count(*),0,'Oracle Secure Backup is NOT in use','Oracle Secure Backup is in use') OSB
FROM
    gv$backup_piece
WHERE
    backed_by_osb = 'YES'
    and rownum<2
]';
END;
/
@@&&9a_pre_one. 



--SELECT
--    COUNT(*),
--    NULL,
--    NULL
--FROM
--    sys.x$kccbp
--WHERE
--    bitand(bpext, 256) = 256
--    AND bitand(bpflg, 1 + 4096 + 8192) = 0;

/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
