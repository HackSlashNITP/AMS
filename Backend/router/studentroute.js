

const express = require("express");
const studentController = require("../controllers/studentc");
const router = express.Router();

// REQUESTS
router.post("/register", studentController.createStudent);
router.get("/:studentId", studentController.getStudentById);
router.get("/:studentId/classrooms", studentController.getAllClassrooms);
router.put("/:studentId", studentController.updateStudent);
router.put("/:studentId/classroom", studentController.concatClassroomId);
router.delete("/:studentId", studentController.deleteStudent);

module.exports = router;

