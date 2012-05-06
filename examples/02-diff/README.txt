
    $ cp -rf ../01-generate-changelog/db .
    $ liquibase diff                         # missing tables pet event
    $ liquibase status --verbose             # 2 changesets not applied
    $ liquibase update
    $ liquibase status --verbose             # uptodate
    $ liquibase diff                         # no diffs
    
    $ liquibase --contexts=data status
    $ liquibase --contexts=data update

