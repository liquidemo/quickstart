#!/bin/bash

rm -rf db
cp -r ../01-generate/db .

../00-setup/install.sh

mysql -uliquibase -pliquibase stage < db-pre/stage.sql
mysql -uliquibase -pliquibase prod < db-pre/prod.sql

