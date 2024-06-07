const express = require("express");
const attendancecontroller = require("../controllers/attendancec");
const router = express.Router();
// Routes
router.post("/:studentID/:SubjectCode/register", attendancecontroller.createStudentAttendance);
router.get("/:studentID/:SubjectCode/attendance", attendancecontroller.getAttendance);
router.put("/present/:studentID/:SubjectCode", attendancecontroller.Present)
router.put("/:studentID/:SubjectCode/absent", attendancecontroller.Absent);
//router.delete("/:attendanceId", attendancecontroller.deleteAttendanceById);
module.exports = router;
