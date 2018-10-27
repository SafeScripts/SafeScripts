const express = require('express');
const app = express();
const bodyParser = require('body-parser');

// Route includes
const mainRouter = require('./routes/main.router');
const dbRouter = require('./routes/postgres.router')

// Body parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

/* Routes */
app.use('/api/main', mainRouter);
app.use('/db', dbRouter);

// App Set //
const PORT = process.env.PORT || 5000;


app.listen(PORT, () => {
  console.log(`Listening on port: ${PORT}`);
});