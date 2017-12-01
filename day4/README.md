# Day 4 project - Deployment

A disription of what was done.


* Postgres was installed.
* A postgres container was added to the docker-compose.yml, that uses the ready made posgres image. 
    * The following enviroment-variables are also set in the docker-compose file as such: 
    ~~~
      - POSTGRES_DB=hgopDB
      - POSTGRES_USER=PostgresAdmin
      - POSTGRES_PASSWORD=AnnaKristin
    ~~~
* Then docker-compose was run using the command `docer-compose up`, and it was verified that they were successfully run using `docker-compose ps` which showed all three containers. 
* The database.js file was made to define the database and the line `const database = require('./database');` was added to app.js to include the database.js file.
* However when docker-compose up was run, some warnings come up and I don't see the line "successfully connected to postgres". I think the connection to database.js is not functioning. However I kept going with the rest of the assignment. 
* The API methods insert and get were added to database.js and two methods to app.js, that use the first two methods. 
* Posting with `curl` returns an error "ERROR Cannot POST /items/duck", so GET does not either work. 

* The docker container was pushed to AWS and can be found here: http://ec2-18-217-150-181.us-east-2.compute.amazonaws.com/ However, the redis connection fails on AWS but works when the web app is run locally with docker-compile

 