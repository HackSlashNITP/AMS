let attendanceRecords = [];
// Controller function to get all attendance records
const getAllAttendance = async (req, res) => {
  try {
    res.json(attendanceRecords);
  } catch (error) {
    console.error("Error in getAllAttendance:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
// Controller function to get a specific attendance record by ID
const getAttendanceById = async (req, res) => {
  try {
    const { attendanceId } = req.params;
    const attendance = attendanceRecords.find(a => a.id === attendanceId);
    if (!attendance) {
      return res.status(404).json({ error: 'Attendance record not found' });
    }
    res.json(attendance);
  } catch (error) {
    console.error("Error in getAttendanceById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
// Controller function to create a new attendance record
const createAttendance = async (req, res) => {
  try {
    const { date, studentId, status } = req.body;
    const newAttendance = {

      id: Math.random().toString(36).substr(2, 9), // Generate a random ID
      date,
      studentId,
      status
    };
    attendanceRecords.push(newAttendance);
    res.status(201).json(newAttendance);
  } catch (error) {
    console.error("Error in createAttendance:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
// Controller function to update a specific attendance record by ID
const updateAttendanceById = async (req, res) => {
  try {
    const { attendanceId } = req.params;
    const { date, studentId, status } = req.body;
    const index = attendanceRecords.findIndex(a => a.id === attendanceId);
    if (index === -1) {
      return res.status(404).json({ error: 'Attendance record not found' });
    }
    attendanceRecords[index] = {
      ...attendanceRecords[index],
      date: date || attendanceRecords[index].date,
      studentId: studentId || attendanceRecords[index].studentId,
      status: status || attendanceRecords[index].status
    };
    res.json(attendanceRecords[index]);
  } catch (error) {
    console.error("Error in updateAttendanceById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
// Controller function to delete a specific attendance record by ID
const deleteAttendanceById = async (req, res) => {
  try {
    const { attendanceId } = req.params;
    const index = attendanceRecords.findIndex(a => a.id === attendanceId);

    if (index === -1) {
      return res.status(404).json({ error: 'Attendance record not found' });
    }

    attendanceRecords.splice(index, 1);

    res.sendStatus(204);
  } catch (error) {
    console.error("Error in deleteAttendanceById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
module.exports = {
  getAllAttendance,
  getAttendanceById,
  createAttendance,
  updateAttendanceById,
  deleteAttendanceById
};