const express = require("express");
const usercontroller = require("../controllers/adminc");

const router = express.Router();

// show all data
router.get("/:adminId", usercontroller.getAdminById);

module.exports = router;
