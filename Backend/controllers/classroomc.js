let classrooms = [];

// Controller function to get all classrooms
const getAllClassrooms = async (req, res) => {
  try {
    res.json(classrooms);
  } catch (error) {
    console.error("Error in getAllClassrooms:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Controller function to get a specific classroom by ID
const getClassroomById = async (req, res) => {
  try {
    const { classroomId } = req.params;
    const classroom = classrooms.find(c => c.id === classroomId);

    if (!classroom) {
      return res.status(404).json({ error: 'Classroom not found' });
    }

    res.json(classroom);
  } catch (error) {
    console.error("Error in getClassroomById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Controller function to create a new classroom
const createClassroom = async (req, res) => {
  try {
    const { name, capacity, section, courseCode } = req.body;
    const newClassroom = {
      id: Math.random().toString(36).substr(2, 9), // Generate a random ID
      name,
      capacity,
      section,
      courseCode
    };

    classrooms.push(newClassroom);

    res.status(201).json(newClassroom);
  } catch (error) {
    console.error("Error in createClassroom:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Controller function to update a specific classroom by ID
const updateClassroomById = async (req, res) => {
  try {
    const { classroomId } = req.params;
    const { name, capacity, section, courseCode } = req.body;
    const index = classrooms.findIndex(c => c.id === classroomId);

    if (index === -1) {
      return res.status(404).json({ error: 'Classroom not found' });
    }

    classrooms[index] = {
      ...classrooms[index],
      name: name || classrooms[index].name,
      capacity: capacity || classrooms[index].capacity,
      section: section || classrooms[index].section,
      courseCode: courseCode || classrooms[index].courseCode
    };

    res.json(classrooms[index]);
  } catch (error) {
    console.error("Error in updateClassroomById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Controller function to delete a specific classroom by ID
const deleteClassroomById = async (req, res) => {
  try {
    const { classroomId } = req.params;
    const index = classrooms.findIndex(c => c.id === classroomId);

    if (index === -1) {
      return res.status(404).json({ error: 'Classroom not found' });
    }

    classrooms.splice(index, 1);

    res.sendStatus(204);
  } catch (error) {
    console.error("Error in deleteClassroomById:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

module.exports = {
  getAllClassrooms,
  getClassroomById,
  createClassroom,
  updateClassroomById,
  deleteClassroomById
};
