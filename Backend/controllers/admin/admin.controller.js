const bcrypt = require("bcrypt");
const validator = require("validator");
const Admin = require("../../models/admin/admin.model");
const Student = require("../../models/student/student.model");
const Teacher = require("../../models/teacher/teacher.model");

exports.createAdmin = async (req, res, next) => {
  try {
    const {
      fullName,
      employeeId,
      dateOfJoining,
      dateOfBirth,
      fathersName,
      mothersName,
      email,
      password,
      phone,
      role,
    } = req.body;

    if (!validator.isEmail(email)) {
      return res.status(400).json({ message: "Invalid email format" });
    }

    if (role !== "admin") {
      return res.status(400).json({ message: "Invalid role specified" });
    }

    const existingUser = await Promise.any([
      Student.findOne({ email }),
      Admin.findOne({ email }),
      Teacher.findOne({ email }),
    ]);

    if (existingUser) {
      return res.status(400).json({ message: "User with this email already exists" });
    }
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const admin = new Admin({
      fullName,
      employeeId,
      dateOfJoining,
      dateOfBirth,
      fathersName,
      mothersName,
      email,
      password: hashedPassword,
      phone,
      role,
    });
    await admin.save();

    res.status(201).json({ message: "Admin created successfully", admin });
  } catch (error) {
    res.status(400).send(error);
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const admin = await Admin.findOne({ email });
    if (!admin) {
      return res.status(401).send("Invalid email or password");
    }

    const isPasswordValid = await bcrypt.compare(password, admin.password);
    if (!isPasswordValid) {
      return res.status(401).send("Invalid email or password");
    }

    res.send("Admin login successful");
  } catch (error) {
    next(error);
  }
};

exports.logout = async (req, res, next) => {
  try {
    res.send("Admin logout");
  } catch (error) {
    next(error);
  }
};

exports.createStudent = async (req, res, next) => {
  try {
    const {
      fullName,
      regNo,
      rollNo,
      std,
      dateOfJoining,
      dateOfBirth,
      fathersName,
      mothersName,
      email,
      password,
      phone,
      role,
    } = req.body;

    const student = new Student({
      fullName,
      regNo,
      rollNo,
      std,
      dateOfJoining,
      dateOfBirth,
      fathersName,
      mothersName,
      email,
      password,
      phone,
      role,
    });
    if (!validator.isEmail(email)) {
      return res.status(400).json({ message: "Invalid email format" });
    }

    if (role !== "student") {
      return res.status(400).json({ message: "Invalid role specified" });
    }

    const existingUser = await Promise.any([
      Student.findOne({ email }),
      Admin.findOne({ email }),
      Teacher.findOne({ email }),
    ]);

    if (existingUser) {
      return res.status(400).json({ message: "User with this email already exists" });
    }
    await student.save();
    res.status(201).json({ message: "Student created successfully", student });
  } catch (error) {
    next(error);
  }
};

exports.createTeacher = async (req, res, next) => {
  try {
    const { name, subject } = req.body;
    const teacher = new Teacher({ name, subject });
    await teacher.save();
    res.status(201).json({ message: "Teacher created successfully", teacher });
  } catch (error) {
    next(error);
  }
};
