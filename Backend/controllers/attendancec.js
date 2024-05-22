const mariadb = require('mariadb');
const pool = require("../helpers/database");
// Controller function to get all attendance records
const getAllAttendance = async (req, res) => {
  let connection;
  try {
    connection = await pool.getConnection();
    const rows = await connection.query("SELECT * FROM Attendance");
    res.json(rows);
  } catch (error) {
    console.error("Error in getAllAttendance:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (connection) connection.release();
  }
};

// Controller function to get a specific attendance record by ID
const getAttendanceById = async (req, res) => {
  const { AttendanceID } = req.params;
  let connection;
  try {
    connection = await pool.getConnection();
    const rows = await connection.query("SELECT * FROM Attendance WHERE id = ?", [AttendanceID]);
    if (rows.length === 0) {
      return res.status(404).json({ error: 'Attendance record not found' });
    }
    res.json(rows[0]);
  } catch (error) {
    console.error("Error in getAttendanceById:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (connection) connection.release();
  }
};

// Controller function to create a new attendance record
const createAttendance = async (req, res) => {
  const { AttendanceDateTime, StudentID, IsPresent } = req.body;
  let connection;
  try {
    connection = await pool.getConnection();
    const result = await connection.query("INSERT INTO Attendance (AttendanceDateTime, StudentID, IsPresent) VALUES (?, ?, ?)", [AttendanceDateTime, StudentID, IsPresent]);
    const newAttendance = {
      id: result.insertId,
      AttendanceDateTime,
      StudentID,
      IsPresent
    };
    res.status(201).json(newAttendance);
  } catch (error) {
    console.error("Error in createAttendance:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (connection) connection.release();
  }
};

// Controller function to update a specific attendance record by ID
const updateAttendanceById = async (req, res) => {
  const { AttendanceID } = req.params;
  const {AttendanceDateTime, StudentID, IsPresent} = req.body;
  let connection;
  try {
    connection = await pool.getConnection();
    const result = await connection.query("UPDATE Attendance SET AttendanceDateTime = ?, StudentID = ?, IsPresent = ? WHERE id = ?", [AttendanceDateTime, StudentID, IsPresent ,AttendanceID]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Attendance record not found' });
    }
    res.json({ id: attendanceId, date, studentId, status });
  } catch (error) {
    console.error("Error in updateAttendanceById:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (connection) connection.release();
  }
};

// Controller function to delete a specific attendance record by ID
const deleteAttendanceById = async (req, res) => {
  const { AttendanceID} = req.params;
  let connection;
  try {
    connection = await pool.getConnection();
    const result = await connection.query("DELETE FROM Attendance WHERE id = ?", [AttendanceID]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Attendance record not found' });
    }
    res.sendStatus(204);
  } catch (error) {
    console.error("Error in deleteAttendanceById:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (connection) connection.release();
  }
};

// Controller function for students to check their attendance percentage
const getAttendancePercentage = async (req, res) => {
  const { StudentID } = req.params;  let connection;
  try {
    connection = await pool.getConnection();
    const rows = await connection.query("SELECT (SUM(IsPresent = 'present') / COUNT(*)) * 100 AS percentage FROM Attendance WHERE StudentID = ?", [StudentID]);
    if (rows.length === 0) {
      return res.status(404).json({ error: 'No attendance records found' });
    }
    res.json({ attendancePercentage: rows[0].percentage });
  } catch (error) {
    console.error("Error in getAttendancePercentage:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (connection) connection.release();
  }
};

// Exporting all controllers
module.exports = {
  getAllAttendance,
  getAttendanceById,
  createAttendance,
  updateAttendanceById,
  deleteAttendanceById,
  getAttendancePercentage
};


