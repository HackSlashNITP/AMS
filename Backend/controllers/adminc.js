let admin = [];
const createAdmin = async (req, res) => {
  const { email, password } = req.body;
  admin.push(email);
  //   console.log(email);
  res.status(201).json({ message: "Admin created successfully", email });
};
const getAdminById = async (req, res) => {
  const id = req.params.adminId;
  console.log(admin[0]);
  res.json({ admin: admin[0] });
};
const updateAdmin = async (req, res) => {};
const deleteAdmin = async (req, res) => {};

module.exports = { createAdmin, getAdminById, updateAdmin, deleteAdmin };
