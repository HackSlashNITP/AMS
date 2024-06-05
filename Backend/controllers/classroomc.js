const pool = require("../helpers/database");
const splitFunction = require("../middleware/middleware");
const app=require("express")();

// Controller function to get all classrooms
const getAllClassrooms = async (req, res) => {
  try {
    const professorId  = req.params.professorId;
    
    if (!professorId || typeof professorId !== "string") {
      return res.status(400).json({ error: "professor ID should be string" });
    }

    const sqlQuery = "SELECT mergedClassroomId FROM admin WHERE professorID = ?";
    let sqlResponse= await pool.query(sqlQuery, [professorId]);

    if (sqlResponse.length === 0) {
      return res.status(404).json({ error: "Classroom not found" });
    }

    //Getting the mergedClassroomId from the response
    let firstElement = sqlResponse[0];
    let mergedClassroomId=firstElement.mergedClassroomId;

    //Splitting the mergedClassroomId into individual classroom IDs
    let allClassrooms=splitFunction(mergedClassroomId,5);
    // ClassroomID Format: [Branch Code]+[Section]+[Professor Initial] eg: CS1KA

    res.json({"Classrooms": allClassrooms}); 

  } catch (error) {
    console.error("Error in getAllClassrooms:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const getClassroomDetails = async (req, res) => {
  try {
    const classroomId  = req.params.classroomId;
    console.log("Classroom ID:",classroomId);
    if (!classroomId || typeof classroomId !== "string") {
      return res.status(400).json({ error: "classroom ID must be string" });
    }

    const sqlQuery = "SELECT * FROM classroom WHERE ClassroomID = ?";
    const rows = await pool.query(sqlQuery, [classroomId]);

    if (rows.length === 0) {
      return res.status(404).json({ error: "Classroom not found" });
    }
    console.log("Rows:", rows);
    res.send(`Classroom ID: ${classroomId}`);

  } catch (error) {
    console.error("Error in getting Classrooms Details:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
module.exports = {
  getAllClassrooms, getClassroomDetails
};
