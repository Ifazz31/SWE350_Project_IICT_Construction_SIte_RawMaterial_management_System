const express = require('express');
var cors = require ('cors');
const connection = require('./connection');
const userRoutes = require('./routes/user');
const itemRoutes = require('./routes/item');
const requisitionRoutes = require('./routes/requisition');
const tenderRoutes = require('./routes/tender');
const auth = require('./auth/authHandler');


const app = express();

app.use(cors());
app.use(express.urlencoded({extended : true}));
app.use(express.json());
app.use('/',userRoutes);
app.use('/item',itemRoutes);
app.use('/requisition',requisitionRoutes);
app.use('/tender',tenderRoutes);
app.use('/auth',auth);

module.exports = app;
