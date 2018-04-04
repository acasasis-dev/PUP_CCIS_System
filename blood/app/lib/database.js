/**
 * Load the 'mysql' module to enable connection to a MySQL database
 */
var mysql = require('mysql');

/**
 * Declare an undefined 'pool' variable
 */
var con;

/**
 * Export a function that returns the pool variable
 */
module.exports = () => {
    /**
     * If pool already has a value, return it.
     */
    if (con) return con;

    /**
     * Otherwise, create a new pool (https://github.com/mysqljs/mysql#pooling-connections)
     * 
     * Notice that the values for the options object of the createPool() function all comes
     * from process.env. Check your .env file. :)
     */
    con = mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        multipleStatements: true
    });

    /**
     * Return the pool variable
     */
    return con;
};