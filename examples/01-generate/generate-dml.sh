#!/bin/bash

topdir=$(dirname $0)/../..
libdir=${topdir}/lib

echo "Running generateChangeLog with data:"
echo 
echo " java -jar ${libdir}/liquibase.jar \\"
echo "     --driver=com.mysql.jdbc.Driver \\"
echo "     --classpath=${libdir}/mysql-connector-java.jar \\"
echo "     --url="jdbc:mysql://localhost/prod" \\"
echo "     --username=liquibase \\"
echo "     --password=liquibase \\"
echo "     --changeLogFile=db/changelog.xml \\"
echo "     --dataOutputDirectory=db/csv \\"
echo "     --difTypes=data \\"
echo "     generateChangeLog"
echo 
echo "Hit return to continue..."
read input

mkdir -p db

java -jar ${libdir}/liquibase.jar                    \
      --driver=com.mysql.jdbc.Driver                 \
      --classpath=${libdir}/mysql-connector-java.jar \
      --url="jdbc:mysql://localhost/prod"            \
      --username=liquibase                           \
      --password=liquibase                           \
      --changeLogFile=db/changelog.xml               \
      --dataOutputDirectory=db/csv                   \
      --diffTypes=data                               \
      generateChangeLog

#--diffTypes=tables,columns,views,primaryKeys,indexes,foreignKeys,sequences,data

