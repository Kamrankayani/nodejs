const express = require('express');
const sampleRouter = require('./routes/sample');

const app = express();

app.use(express.json());
app.use('/api', sampleRouter);

module.exports = app;
