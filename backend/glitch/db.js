const Pool = require("pg").Pool;
// colocar los datos comentados a la derecha de cada variable 
// obtenido de la creación de la instancia en elephant
const pool = new Pool({
    user:'***', // User & Default database
    host:'***', // Server
    database:'***', // User & Default database
    password:'***', // Password
    port:'***' //default port
});

module.exports = pool;