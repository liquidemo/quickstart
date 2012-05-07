#!/bin/bash

rm -rf db
cp -r db-pre db

../00-setup/install.sh

mysql -uliquibase -pliquibase stage < db-pre/stage.sql
mysql -uliquibase -pliquibase prod < db-pre/prod.sql

