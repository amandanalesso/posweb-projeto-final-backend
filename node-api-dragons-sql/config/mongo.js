const { MongoClient } = require('mongodb');

const mongoUrl = 'mongodb://localhost:27017';
const mongoDbName = 'setup_dragons_db_mongo';
let mongoClient;

const connectMongo = async () => {
  if (!mongoClient) {
    mongoClient = new MongoClient(mongoUrl);
    await mongoClient.connect();
  }
  return mongoClient.db(mongoDbName);
};

module.exports = connectMongo;
