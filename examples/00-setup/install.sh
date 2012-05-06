#!/bin/bash

echo 
echo "*** WARNING *********************************************"
echo "This script will drop the PROD and STAGE database as well"
echo "as the liquibase user!                                   "
echo "                                                         "
echo "Enter mysql root password to continue or CTRL-C to abort."
echo "*********************************************************"
echo 

DIR="$(cd $(dirname $0) && pwd)"

mysql -uroot -p << EOF

    DROP DATABASE IF EXISTS stage;
    DROP DATABASE IF EXISTS prod;
    GRANT USAGE ON *.* TO 'liquibase'@'localhost';
    DROP USER 'liquibase'@'localhost';

    CREATE USER 'liquibase'@'localhost' IDENTIFIED BY 'liquibase';
    CREATE DATABASE stage;
    CREATE DATABASE prod;
    GRANT ALL ON stage.* TO 'liquibase'@'localhost';
    GRANT ALL ON prod.* TO 'liquibase'@'localhost';

EOF

mysql -uliquibase -pliquibase prod < $DIR/install.sql
