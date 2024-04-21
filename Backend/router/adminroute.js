const express = require("express");
const usercontroller = require("../controllers/adminc");

const router = express.Router();

// show all data
router.post("/register", usercontroller.createAdmin);
router.get("/:adminId", usercontroller.getAdminById);
router.put("/:adminId", usercontroller.updateAdmin);
router.delete("/:adminId", usercontroller.deleteAdmin);

module.exports = router;
