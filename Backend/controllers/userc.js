const pool = require("../helpers/database");
const fs = require("fs").promises;

const filePath = "./helpers/user.sql";
let tableCreated = false;

const createUser = async (req, res) => {
  try {
    const { Username, Password, UserType } = req.body;
    if (!Username || !Password) {
      return res.status(400).json({ error: "Email and password are required" });
    }
   

  
    if (!tableCreated) {
      const createTableQuery = await fs.readFile(filePath, "utf-8");
      await pool.query(createTableQuery);
      tableCreated = true;
    }

    const insertQuery =
      "INSERT INTO users (Username, Password, UserType) VALUES (?, ?, ?)";
    const result = await pool.query(insertQuery, [
      Username,
      Password,
      UserType,
    ]);
    console.log(result);

  
    res.status(201).json({ message: "User created successfully" });
  } catch (error) {
    console.error("Error in createUser:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const getUserById = async (req, res) => {
  try {
    const id = req.params.userId;
    if (id < 0 || isNaN(id)) {
      return res
        .status(404)
        .json({ error: "User ID must be a positive number" });
    }

    console.log("User ID:", id);

    const sqlQuery = "SELECT * FROM users WHERE UserID = ?";
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

const updateUser = async (req, res) => {
  try {
    const userId = req.params.userId;
    const { Username, Password, UserType } = req.body;

    if (userId < 0 || isNaN(userId)) {
      return res.status(400).json({ error: "Invalid user ID" });
    }

    const updateQuery =
      "UPDATE users SET Username=?, Password=?, UserType=? WHERE UserID=?";
    const result = await pool.query(updateQuery, [
      Username,
      Password,
      UserType,
      userId,
    ]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    res.status(200).json({ message: "User updated successfully" });
  } catch (error) {
    console.error("Error in updateUser:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const deleteUser = async (req, res) => {
  try {
    const userId = req.params.userId;

    if (userId < 0 || isNaN(userId)) {
      return res.status(400).json({ error: "Invalid user ID" });
    }

    const deleteQuery = "DELETE FROM users WHERE UserID=?";
    const result = await pool.query(deleteQuery, [userId]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    res.status(200).json({ message: "User deleted successfully" });
  } catch (error) {
    console.error("Error in deleteUser:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

module.exports = { createUser, getUserById, updateUser, deleteUser };
