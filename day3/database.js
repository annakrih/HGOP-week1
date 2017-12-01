const { Client } = require('pg');

function getClient() {
    return new Client({
        host: "my_posgres_container",
        user: "PostgresAdmin",
        password: "AnnaKristin",
        database: "hgopDB"
    });
}

function initialize() {
    var client = getClient();
    client.connect(() => {
        client.query('CREATE TABLE IF NOT EXISTS Item (ID SERIAL PRIMARY KEY, Name VARCHAR(32) NOT NULL, InsertDate TIMESTAMP NOT NULL);', (err) => {
            console.log('successfully connected to postgres!')
            client.end();            
        });
    });
}

module.exports = {

    // param name: item name.
    // param insertDate: item insertdate.
    // param onInsert: on item insert callback method.
    insert: (name, insertDate, onInsert) => {
        //get the client
        var client = getClient();
        client.connect (() => {

            //build SQL query
            var sqlQ = 'INSERT INTO Item(Name, InsertDate) VALUES (' + name + ', ' + insertDate + ');'; 

            //process the SQL query
            client.query(sqlQ, (err) => {
                
                //perferm the callback if the insert was successfull
                callback(onInsert);
                client.end();  
        });
    },
    // Should get the top 10 items sorted by inserteddate descending.
    // param onGet: on items get callback method.
    get: (onGet) => {
        //get the client
        var client = getClient();
        client.connect (() => {
            client.query('SELECT * FROM Item ORDER BY InsertDate DESC', (err) => {
                callback(onGet);
                client();
            });
        });
    }
}

// give the postgres container a couple of seconds to setup.
setTimeout(initialize, 10000);