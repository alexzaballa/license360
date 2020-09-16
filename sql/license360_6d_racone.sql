/*****************************************************************************************/

DEF title = 'Rac One Node';
DEF main_table = 'v$parameter';

BEGIN

  :sql_text := q'[
select decode(upper(KJIDTV),'RACONENODE','RAC ONE NODE is Enabled','RAC ONE NODE is not Enabled') RACONENODE 
  from sys.x$kjidt
]';

END;
/
@@&&skip_when_notsys.&&9a_pre_one.


/*****************************************************************************************/

DEF skip_lch = 'Y';
DEF skip_pch = 'Y';

/*****************************************************************************************/
