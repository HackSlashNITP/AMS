const pool = require("../helpers/database");
const fs = require("fs").promises;
const splitFunction = require("../middleware/middleware");
const filePath = "./helpers/student.sql";
let tableCreated = false;

const createStudent = async (req, res) => {
  try {
    const { studentId, name, department, section, mergedClassroomId } = req.body;

    const tableExists = await pool.query('SHOW TABLES LIKE ?', ['students']);

    if(!tableExists.length) {
      const createTableQuery = await fs.readFile(filePath, "utf-8");
      await pool.query(createTableQuery);
    }

    const insertQuery = "INSERT INTO students (studentId, name, department, section, mergedClassroomId) VALUES (?, ?, ?, ?, ?)";
    const result = await pool.query(insertQuery, [studentId, name, department, section, mergedClassroomId]);
    
    res.status(201).json({ message: "Student created successfully" });
  } catch (error) {
    console.error("Error in createStudent:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const getStudentById = async (req, res) => {
  try {
    const { studentId } = req.params;

    if (!studentId || typeof studentId !== "string") {
      return res.status(400).json({ error: "Student ID must be a string" });
    }

    const sqlQuery = "SELECT * FROM students WHERE studentId = ?";
    const rows = await pool.query(sqlQuery, [studentId]);

    if (rows.length === 0) {
      return res.status(404).json({ error: "Student not found" });
    }
    res.json({ student: rows[0] });
  } catch (error) {
    console.error("Error in getStudentById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const updateStudent = async (req, res) => {
  try {
    const { studentId } = req.params;
    const { name, department, section, mergedClassroomId } = req.body;

    if (!studentId || typeof studentId !== "string") {
      return res.status(400).json({ error: "Invalid student ID" });
    }

    const updateQuery = "UPDATE students SET name=?, department=?, section=?, mergedClassroomId=? WHERE studentId=?";
    const result = await pool.query(updateQuery, [name, department, section, mergedClassroomId, studentId]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Student not found" });
    }

    res.status(200).json({ message: "Student updated successfully" });
  } catch (error) {
    console.error("Error in updateStudent:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const deleteStudent = async (req, res) => {
  try {
    const { studentId } = req.params;

    if (!studentId || typeof studentId !== "string") {
      return res.status(400).json({ error: "Invalid student ID" });
    } 

    const deleteQuery = "DELETE FROM students WHERE studentId=?";
    const result = await pool.query(deleteQuery, [studentId]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Student not found" });
    }

    res.status(200).json({ message: "Student deleted successfully" });
  } catch (error) {
    console.error("Error in deleteStudent:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
 // get all classrooms of a particular student
const getAllClassrooms = async (req, res) => {
  try {
    const { studentId } = req.params;

    const sqlQuery = "SELECT mergedClassroomId FROM students WHERE studentId = ?";
    const rows = await pool.query(sqlQuery, [studentId]);

    if (rows.length === 0) {
      return res.status(404).json({ error: "Student not found" });
    }

    const mergedClassroomId = rows[0].mergedClassroomId;
    const allClassrooms = splitFunction(mergedClassroomId, 5);

    res.json({ classrooms: allClassrooms });
  } catch (error) {
    console.error("Error in getAllClassrooms:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};



const concatClassroomId=async (req, res) => {
  try{
      let professorCode=req.body.professorCode;
      let studentId=req.params.studentId;
      //the department,section and current mergedClassroomId is fetched in order to update its value
      let getSqlQuery=
      "SELECT department,section,mergedClassroomId FROM students WHERE studentId = ?";
      let getSqlResponse= await pool.query(getSqlQuery, [studentId]);
      let firstElement = getSqlResponse[0];
      let mergedClassroomId=firstElement.mergedClassroomId;
      let dept=firstElement.department[0]+firstElement.department[1];
      let section=firstElement.section;
      //If already enrolled in 5 classes:-
      if(mergedClassroomId.length==25){
        return res.status(403).json({message: "Student already enrolled in 5 classes"})
      }
      //Value updated
      mergedClassroomId=mergedClassroomId+dept+section+professorCode;
      let updateSqlQuery="UPDATE students SET mergedClassroomId=? WHERE studentId=?";
      const result = await pool.query(updateSqlQuery, [ 
          mergedClassroomId,
          studentId,
      ]);
      if (result.affectedRows === 0) {
          return res.status(404).json({ error: "Student not found" });
      }
      res.status(200).json({ message: "Student updated successfully" });

  }catch{
      console.error("Error in addClassroom:", error);
      res.status(500).json({ error: "Internal server error" });
  }
};
module.exports = { createStudent, getStudentById, updateStudent, deleteStudent, getAllClassrooms, concatClassroomId };
