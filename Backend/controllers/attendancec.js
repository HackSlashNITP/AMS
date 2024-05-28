const fs = require('fs').promises;
const pool = require("../helpers/database");

let tableCreated = false;

const createAttendance = async (req, res) => {
  const { AttendanceDateTime, StudentID, ScheduleID, IsPresent } = req.body;
  let connection;
  try {
    if (!tableCreated) {
      const createTableQuery = await fs.readFile('./helpers/attendance.sql', 'utf-8');
      connection = await pool.getConnection();
      await connection.query(createTableQuery);
      tableCreated = true;
    } else {
      connection = await pool.getConnection();
    }

    const result = await connection.query(
      "INSERT INTO Attendance (AttendanceDateTime, StudentID, ScheduleID, IsPresent) VALUES (?, ?, ?, ?)",
      [AttendanceDateTime, StudentID, ScheduleID, IsPresent]
    );
    const newAttendance = {
      AttendanceID: result.insertId,
      AttendanceDateTime,
      StudentID,
      ScheduleID,
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

// Other controller functions

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

const getAttendanceById = async (req, res) => {
  const { AttendanceID } = req.params;
  let connection;
  try {
    connection = await pool.getConnection();
    const rows = await connection.query("SELECT * FROM Attendance WHERE AttendanceID = ?", [AttendanceID]);
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

const updateAttendanceById = async (req, res) => {
  const { AttendanceID } = req.params;
  const { AttendanceDateTime, StudentID, ScheduleID, IsPresent } = req.body;
  let connection;
  try {
    connection = await pool.getConnection();
    const result = await connection.query(
      "UPDATE Attendance SET AttendanceDateTime = ?, StudentID = ?, ScheduleID = ?, IsPresent = ? WHERE AttendanceID = ?",
      [AttendanceDateTime, StudentID, ScheduleID, IsPresent, AttendanceID]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Attendance record not found' });
    }
    res.json({ AttendanceID, AttendanceDateTime, StudentID, ScheduleID, IsPresent });
  } catch (error) {
    console.error("Error in updateAttendanceById:", error);
    res.status(500).json({ error: "Internal server error" });
  } finally {
    if (connection) connection.release();
  }
};

const deleteAttendanceById = async (req, res) => {
  const { AttendanceID } = req.params;
  let connection;
  try {
    connection = await pool.getConnection();
    const result = await connection.query("DELETE FROM Attendance WHERE AttendanceID = ?", [AttendanceID]);
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

const getAttendancePercentage = async (req, res) => {
  const { StudentID } = req.params;
  let connection;
  try {
    connection = await pool.getConnection();
    const rows = await connection.query(
      "SELECT (SUM(IsPresent = true) / COUNT(*)) * 100 AS percentage FROM Attendance WHERE StudentID = ?",
      [StudentID]
    );
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

module.exports = {
  getAllAttendance,
  getAttendanceById,
  createAttendance,
  updateAttendanceById,
  deleteAttendanceById,
  getAttendancePercentage
};
