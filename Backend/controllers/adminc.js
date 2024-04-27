let admin = [];
const createAdmin = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Validate email and password
    if (!email || !password) {
      return res.status(400).json({ error: "Email and password are required" });
    }

    // Check if email already exists
    if (admin.includes(email)) {
      return res.status(400).json({ error: "Email already exists" });
    }

    // Add admin
    admin.push(email);
    res.status(201).json({ message: "Admin created successfully", email });
  } catch (error) {
    console.error("Error in createAdmin:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

const getAdminById = async (req, res) => {
  try {
    const id = req.params.adminId;

    // Check if admin exists
    if (id >= admin.length || id < 0 || isNaN(id)) {
      return res.status(404).json({ error: "Admin not found" });
    }

    res.json({ admin: admin[id] });
  } catch (error) {
    console.error("Error in getAdminById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
const updateAdmin = async (req, res) => {
  try {
    // Implementation for updating admin
    // Add your code here
  } catch (error) {
    console.error("Error in updateAdmin:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
const deleteAdmin = async (req, res) => {
  try {
    // Implementation for deleting admin
    // Add your code here
  } catch (error) {
    console.error("Error in deleteAdmin:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

module.exports = { createAdmin, getAdminById, updateAdmin, deleteAdmin };
