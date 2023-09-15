require('dotenv').config();
require('express-async-errors');
const express = require('express');
const app = express();

// middlewares
const notFound = require('./middlewares/notFoundMiddleware.js');
const errorHandler = require('./middlewares/errorHandlerMiddleware.js');

// routers
const authRouter = require('./routes/authRoutes.js');
const favorisRouter = require('./routes/favorisRoutes.js');
const consoleRouter = require('./routes/consoleRoutes.js');
const userRouter = require('./routes/userRoutes.js');
app.use(express.json());

app.use('/api/v1/auth', authRouter);
app.use('/api/v1/favoris', favorisRouter);
app.use('/api/v1/console', consoleRouter);
app.use('/api/v1/user', userRouter);

app.use(notFound);
app.use(errorHandler);

const port = 5000;
app.listen(port, () => console.log(`Server is listening on ${port}...`));
