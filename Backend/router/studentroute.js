const express = require("express");
const studentcontroller = require("../controllers/studentc");
const router = express.Router();
// REQUESTS
router.post("/register", studentcontroller.createStudent);
router.get("/student", studentcontroller.getStudentById);
router.get("/classrooms", studentcontroller.getAllClassrooms);
router.put("/updateDetails", studentcontroller.updateStudent);
router.put("/concatClassroomId", studentcontroller.concatClassroomId);
router.delete("/:userId", studentcontroller.deleteStudent);
module.exports = router;
