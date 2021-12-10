const path = require("path");
const cors = require('cors');
const express = require("express");
const server = express();
const router = require('./routes/router')
const { initializeSingleDatabase } = require('./db')

const PORT = 3080;

initializeSingleDatabase()

server.use(cors())
server.use(express.json())
server.use(express.static(path.resolve(__dirname, "dist")));

server.use('/api', router)

server.get("*", (_, res) => res.sendFile(path.resolve(__dirname, "dist", "index.html")));

server.listen(PORT, () => console.log("Server Started..."));
