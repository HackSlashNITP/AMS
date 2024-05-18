const express = require("express");
const classroomcontroller = require("../controllers/classroomc");
const router = express.Router();
// show all data
// router.post("/create", classroomcontroller.createClassroom);
router.get("/classrooms", classroomcontroller.getAllClassrooms);
router.get("/:classroomId", classroomcontroller.getClassroomById);
// router.delete("/:classroomId", classroomcontroller.deleteClassroomById);

module.exports = router;
