const mongoose = require("mongoose");
const DB_NAME = require('../src/constants')

require("dotenv").config();


const connectDB = async () => {
  try {
    const connectionInstance = await mongoose.connect(
      `${process.env.MONGODB_URI}/${DB_NAME}`
    );
    console.log(
      `\nMongoDB connected !! DB HOST: ${connectionInstance.connection.host}`
    );
  } catch (error) {
    console.log("MongodDB connection failed: ", error);
  }
};

module.exports =  connectDB;
