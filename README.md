# License360

License360 is a tool to help on checking Oracle Database license usage.

1. Unzip license360.zip, navigate to the root license360 directory, and connect as SYS, 
   DBA, or any User with Data Dictionary access:

   $ unzip license360.zip
   $ cd license360
   $ sqlplus / as sysdba

2. Execute license360.sql.

   SQL> @license360.sql


Usage: 

@license360

@license360 N L

@license360 N E

@license360 T F

@license360 T F 1

@license360 T F 1-3


1st parameter: (T)uning pack, (D)iagnostic pack, (N)one - Default (N)
2nd parameter: (F)ull, (L)ight, (E)xtra Light  - Default (L)
3rd parameter: sections (optional) - default all sections

3. Unzip output license360_<dbname>_<host>_YYYYMMDD_HH24MI.zip into a directory on your PC

4. Review main html file 00001_license360_<dbname>_index.html



## Notes ##

1. As License360 can run for a long time, in some systems it's recommend to execute it unattended:

   $ nohup sqlplus / as sysdba @license360.sql T F &

2. If you need to execute License360 against all databases in the host, use license360.sh:

   $ unzip license360.zip
   $ cd license360
   $ sh license360.sh T F
   
3. If you need to execute only a portion of License360 (i.e. a column, section or range) use 
   these commands. Notice first parameter can be set to one section (i.e. 1c),
   one column (i.e. 3), a range of sections (i.e. 1a-2a) or range of columns (i.e. 1-2):

   SQL> @license360.sql T F 1
   
   note: valid column range for last parameter is 1 to 4. 


## Versions ##
* v01 (2020-09-16) by Alex Zaballa
