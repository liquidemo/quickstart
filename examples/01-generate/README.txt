
1. Generate a changelog from existing database by running:

   $ generate-changelog.sh
    
   The generated changelog will be created in db/changelog.xml. 


2. Edit the id and author and rename the changelog to v0.xml:

    $ vim db/changelog.xml          # update author and id attributes
    $ liquibase status --verbose
    $ liquibase update              # will not work because tables already exists
    $ liquibase changelogSync
    $ liquibase status --verbose
    
