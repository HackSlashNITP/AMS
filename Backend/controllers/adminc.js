const pool = require("../helpers/database");

const getAdminById = async (req, res) => {
  try {
    const id = req.params.adminId;
    if (!id || typeof id !== "string") {
      return res.status(400).json({ error: "Admin ID must be a string" });
    }

    console.log("Admin ID:", id);

    const sqlQuery = "SELECT * FROM admin WHERE adminID = ?";
    const [rows, fields] = await pool.query(sqlQuery, [id]);

    console.log("Rows:", rows);

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
