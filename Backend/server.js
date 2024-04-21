const express = require("express");
const bodyParser = require("body-parser");
const PORT = 3000;

const app = express();
app.use(bodyParser.json());

const userroute = require("./router/userroute");
const adminroute = require("./router/adminroute");

app.use("/admin", adminroute);
app.use("/user", userroute);

app.listen(PORT, () => {
  console.log("Server is running on ", PORT);
});
