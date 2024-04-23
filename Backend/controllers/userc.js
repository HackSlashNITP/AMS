let user = [];

const createUser = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Validate email and password
    if (!email || !password) {
      return res.status(400).json({ error: "Email and password are required" });
    }

    // Check if email already exists
    if (user.includes(email)) {
      return res.status(400).json({ error: "Email already exists" });
    }

    // Add user
    user.push(email);
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
    if (id >= user.length || id < 0 || isNaN(id)) {
      return res.status(404).json({ error: "User not found" });
    }

    res.json({ user: user[id] });
  } catch (error) {
    console.error("Error in getUserById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const updateUser = async (req, res) => {
  try {
    // Implementation for updating user
  } catch (error) {
    console.error("Error in updateUser:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const deleteUser = async (req, res) => {
  try {
    // Implementation for deleting user
  } catch (error) {
    console.error("Error in deleteUser:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

module.exports = { createUser, getUserById, updateUser, deleteUser };
