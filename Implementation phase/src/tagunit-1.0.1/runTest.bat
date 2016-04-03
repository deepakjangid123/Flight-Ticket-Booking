set _CLASSPATH=%CLASSPATH%
set CLASSPATH=tagunit-core\lib\tagunit.jar;
call ant -buildfile test.xml %1
set CLASSPATH=%_CLASSPATH%