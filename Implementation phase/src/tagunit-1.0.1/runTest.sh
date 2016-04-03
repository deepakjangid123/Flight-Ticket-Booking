export _CLASSPATH=$CLASSPATH
export CLASSPATH=./tagunit-core/lib/tagunit.jar
ant -buildfile test.xml $1
export CLASSPATH=$_CLASSPATH