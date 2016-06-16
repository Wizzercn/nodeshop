/**
 * Created by root on 20/4/16.
 */
module.exports.mysql = {
  host: process.env.MYSQL_HOST||'127.0.0.1',
  user: process.env.MYSQL_USER||'root',
  password: process.env.MYSQL_PASSWORD||'root',
  database: process.env.MYSQL_DATABASE||'demo',
  pool: true,
  connectionLimit: process.env.MYSQL_LIMIT||50,
  waitForConnections: true
};
