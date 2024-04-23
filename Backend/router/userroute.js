const express = require("express");
const usercontroller = require("../controllers/userc");

const router = express.Router();

// REQUESTS

router.post("/register", usercontroller.createUser);
router.get("/:userId", usercontroller.getUserById);
router.put("/:userId", usercontroller.updateUser);
router.delete("/:userId", usercontroller.deleteUser);

module.exports = router;
