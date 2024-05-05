  // IMPORTS
const express = require("express");
const bodyParser = require("body-parser");
const PORT = 3000;
const userroute = require("./router/userroute");
const adminroute = require("./router/adminroute");
const classroomroute = require("./router/classroomroute");
const attendanceroute= require("./router/attendanceroute")
  // INIT
const app = express();
app.use(bodyParser.json());

  // ROUTES

app.use("/admin", adminroute);
app.use("/user", userroute);
app.use("/classroom", classroomroute);
app.use("/attendance",attendanceroute)


// PORT LISTENING

app.listen(PORT, () => {
  console.log("Server is running on ", PORT);
});
