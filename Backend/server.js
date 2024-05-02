// IMPORTS
const express = require("express");
const bodyParser = require("body-parser");
// const PORT = 3000;
const dotenv = require("dotenv");
dotenv.config({ path: ".env-local" });
const PORT = process.env.PORT || 3000;
const userroute = require("./router/userroute");
const adminroute = require("./router/adminroute");

// INIT
const app = express();
app.use(bodyParser.json());
app.use(express.json());

// ROUTES

app.use("/admin", adminroute);
app.use("/user", userroute);

// PORT LISTENING

app.listen(PORT, () => {
  console.log("Server is running on ", PORT);
});
