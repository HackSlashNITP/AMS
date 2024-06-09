const express = require("express");
const admincontroller = require("../controllers/adminc");
const router = express.Router();
// show all data
router.get('/:adminId', admincontroller.getAdminById);
module.exports = router;
