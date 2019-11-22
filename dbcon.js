var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_parksju',
  password        : '5678',
  database        : 'cs340_parksju'
});
module.exports.pool = pool;
