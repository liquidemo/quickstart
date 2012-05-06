EXAMPLE: 00-setup-mysql
=======================

Install the menagerie example database.

1. Make sure you are using innodb as default storage engine in mysql
   by editing /etc/mysql/my.cnf and restarting:
   
   [mysqld]
   default_storage_engine = innodb 

2. Create a new database and user:

    $ mysql -uroot -p 
    > CREATE USER 'liquibase'@'localhost' IDENTIFIED BY 'liquibase';
    > CREATE DATABASE stage;
    > GRANT ALL ON stage.* TO 'liquibase'@'localhost';

    > CREATE DATABASE prod;
    > GRANT ALL ON prod.* TO 'liquibase'@'localhost';

3. Import the sample database:

    $ mysql -uliquibase -pliquibase stage < install.sql
