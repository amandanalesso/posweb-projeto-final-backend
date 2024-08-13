const mysqlPool = require('../config/mysql');
const connectMongo = require('../config/mongo');

const migrateTable = async (tableName, mongoCollectionName) => {
  try {
    const [rows] = await mysqlPool.query(`SELECT * FROM ${tableName}`);
    const db = await connectMongo();
    const collection = db.collection(mongoCollectionName);
    await collection.insertMany(rows);
    console.log(`Migrated ${tableName} to MongoDB collection ${mongoCollectionName}`);
  } catch (error) {
    console.error(`Error migrating ${tableName}: ${error.message}`);
  }
};

const migrateAll = async () => {
  await migrateTable('dragons', 'dragons');
  await migrateTable('Houses', 'houses');
  await migrateTable('Characters', 'characters');
  await migrateTable('Battles', 'battles');
  await migrateTable('Riders', 'riders');
  await migrateTable('DragonBattles', 'dragonBattles');
};

module.exports = migrateAll;
