-- Put here any customization that you want to load always after executing the sections.
-- Note it will load only once in the end.

--
UNDEF default_user_list_1
UNDEF default_user_list_2
--
--
HOS zip -mj &&moat369_zip_filename. quick_db_view_*.txt > /dev/null

--zip ddl for users and tablespaces
HOS zip -mj &&moat369_zip_filename. ddl_users.txt > /dev/null
HOS zip -mj &&moat369_zip_filename. ddl_tablespaces.txt > /dev/null
HOS zip -mj &&moat369_zip_filename. ddl_dbconf.txt > /dev/null