let user = [];
const createUser = async (req, res) => {
  const { email, password } = req.body;
  user.push(email);
  res.status(201).json({ message: "User created successfully" });
};
const getUserById = async (req, res) => {
  const id = req.params.userId;
  res.json({ user: user[0] });
};
const updateUser = async (req, res) => {};
const deleteUser = async (req, res) => {};

module.exports = { createUser, getUserById, updateUser, deleteUser };
