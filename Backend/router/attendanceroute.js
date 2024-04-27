const express = require("express");
const attendancecontroller = require("../controllers/attendancec");
const router = express.Router();
// Routes
router.post("/", attendancecontroller.createAttendance);
router.get("/", attendancecontroller.getAllAttendance);
router.get("/:attendanceId", attendancecontroller.getAttendanceById)
router.put("/:attendanceId", attendancecontroller.updateAttendanceById);
router.delete("/:attendanceId", attendancecontroller.deleteAttendanceById);
mod  ule.exports = router;