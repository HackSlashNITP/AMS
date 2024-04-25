const pool = require("../helpers/database");

let user = [];

const createUser = async (req, res) => {
  try {
    const { Username, Password ,UserType} = req.body;
    // Validate email and password
    if (!Username || !Password) {
      return res.status(400).json({ error: "Email and password are required" });
    }
    // Check if email already exists
    if (user.includes(Username)) {
      return res.status(400).json({ error: "Email already exists" });
    }
   const sqlQuery='INSERT INTO users (Username, Password, UserType) VALUES (?, ?, ?)';
   const result = await pool.query(sqlQuery,[Username,Password,UserType]);
   console.log(result);
    // Add user
    user.push(Username);
    res.status(201).json({ message: "User created successfully" });
  } catch (error) {
    console.error("Error in createUser:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const getUserById = async (req, res) => {
  try {
    const id = req.params.userId;
  
    // Check if user exists
    // if (id > user.length || id < 0 || isNaN(id)) {
      if ( id < 0 || isNaN(id)) {
      return res.status(404).json({ error: "User not found" });
    }
  // Query
  const sqlQuery = 'SELECT * FROM Users WHERE UserID = ?';
  const [rows, fields] = await pool.query(sqlQuery, [id]);
   // Check if user exists
   if (rows.length === 0) {
    return res.status(404).json({ error: "User not found" });
  }
    res.json({ user: rows});
  } catch (error) {
    console.error("Error in getUserById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const updateUser = async (req, res) => {
  try {
    const userId = req.params.userId;
    const { Username, Password, UserType } = req.body;

    // Check if user ID is valid
    if (userId < 0 || isNaN(userId)) {
      return res.status(400).json({ error: "Invalid user ID" });
    }

    //  SQL query  to update fields which are provided in the body
    let sqlQuery = 'UPDATE `users` SET';
    const updateValues = [];

    if (Username) {
      sqlQuery += ' `Username` = ?,';
      updateValues.push(Username);
    }

    if (Password) {
      sqlQuery += ' `Password` = ?,';
      updateValues.push(Password);
    }

    if (UserType) {
      sqlQuery += ' `UserType` = ?,';
      updateValues.push(UserType);
    }

    // Remove the trailing comma if there are any fields to update
    if (updateValues.length === 0) {
      return res.status(400).json({ error: "No fields provided for update" });
    }

    //  WHERE to specify the user to update
    sqlQuery = sqlQuery.slice(0, -1); 
    sqlQuery += ' WHERE `UserID` = ?';
    updateValues.push(userId);

    // Query to update the user
    const result = await pool.query(sqlQuery, updateValues);

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

    // Check if user ID is valid
    if (userId < 0 || isNaN(userId)) {
      return res.status(400).json({ error: "Invalid user ID" });
    }

    // Query to delete the user
    const sqlQuery = 'DELETE FROM `users` WHERE `UserID` = ?';
    const result = await pool.query(sqlQuery, [userId]);

    // Check if any rows were affected by the delete operation
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    // Send success response
    res.status(200).json({ message: "User deleted successfully" });
  } catch (error) {
    console.error("Error in deleteUser:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};


module.exports = { createUser, getUserById, updateUser, deleteUser };
