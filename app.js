const express = require('express');
const app = express();
require('dotenv').config();

// middlewares
const notFound = require('./middlewares/notFoundMiddleware.js');
const errorHandler = require('./middlewares/errorHandlerMiddleware.js');

// routers
const authRouter = require('./routes/authRoutes.js');
const favorisRouter = require('./routes/favorisRoutes.js');

app.use(express.json());

app.use('/api/v1/auth', authRouter);
app.use('/api/v1/favoris', favorisRouter);
app.use(notFound);
app.use(errorHandler);

const port = 5000;
app.listen(port, () => console.log(`Server is listening on ${port}...`));
