import knexObj from 'knex';
// import * as dotenv from 'dotenv'
// dotenv.config()

export default knexObj({
  client: 'mssql',
  connection: {
    host: '127.0.0.1',
    port: 1433,
    user: 'sa',
    password: '123',
    database: 'QLGH'
  }
});

