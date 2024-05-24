const pool = require("../helpers/database");
const splitFunction = require("../middleware/middleware");
const app=require("express")();

// Controller function to get all classrooms
const getAllClassrooms = async (req, res) => {
  try {
    let professorId=req.body.professorId;
    const sqlQuery = "SELECT mergedClassroomId FROM admin WHERE professorID = ?";
    let sqlResponse= await pool.query(sqlQuery, [professorId]);
    let firstElement = sqlResponse[0];
    let mergedClassroomId=firstElement.mergedClassroomId;
    let allClassrooms=splitFunction(mergedClassroomId,5);
    // ClassroomID Format: [Branch Code]+[Section]+[Professor Initial] eg: CS1KA
    res.json({"Classrooms": allClassrooms}); 
  } catch (error) {
    console.error("Error in getAllClassrooms:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Controller function to get a specific classroom by ID
const getClassroomById = async (req, res) => {
  try {
    const id = req.params.classroomId;
    if (!id || typeof id !== "string") {
      return res.status(400).json({ error: "Classroom ID must be a string" });
    }

    console.log("Classroom ID:", id);

    const sqlQuery = "SELECT * FROM classroom WHERE classroomID = ?";
    const [rows, fields] = await pool.query(sqlQuery, [id]);

    console.log("Rows:", rows);

    if (rows.length === 0) {
      return res.status(404).json({ error: "User not found" });
    }
    res.json({ user: rows });
  } catch (error) {
    console.error("Error in getUserById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Controller function to update a specific classroom by ID

module.exports = {
  getAllClassrooms,
  getClassroomById,
};
