const { json } = require("body-parser");
const pool = require("../helpers/database");

const getAdminById = async (req, res) => {
  try {
    const adminId = req.params.adminId

    if (!adminId ) {
      return res.status(400).json({ error: "Professor ID must be a string" });
    }

    const sqlQuery = "SELECT * FROM admin WHERE professorID=?";
    const rows = await pool.query(sqlQuery,[adminId]);

    console.log("Rows:", rows);
   // console.log("Rows:", rows);

    if (rows.length === 0) {
      return res.status(404).json({ error: "Admin not found" });
    }
    res.json({ admin: rows });
  } catch (error) {
    console.error("Error in getAdminById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

module.exports = {getAdminById};
