# tournament-results
Project 4 of Udacity's full stack nanodegree. A swiss-system tournament tracker built using Python and PostgreSQL.

This project was built with [this VM environment supported by Udacity](https://github.com/udacity/fullstack-nanodegree-vm). It comes with the configurations and dependencies needed for this project to run.

Inside the VM, ```cd``` into this project and run this line to setup the database:
```
psql
```

Then inside the psql prompt run this line to initiliaze the tables.
```
\i tournament.sql;
```

Once the import is finished, exit the prompt and you are all set. To confirm, run this test file:
```
python tournament_test.py
```

