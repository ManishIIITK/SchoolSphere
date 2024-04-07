const jwt = require('jsonwebtoken');
const { promisify } = require('util');
const Admin = require('../models/admin/admin.model');
const Teacher = require('../models/teacher/teacher.model');
const Student = require('../models/student/student.model');

const authMiddleware = async (req, res, next) => {
  try {
    const token = req.headers.authorization;

    if (!token) {
      return res.status(401).json({ message: 'Unauthorized: No token provided' });
    }

    const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);

    // Check if user exists based on decoded user ID
    let user;
    if (decoded.role === 'admin') {
      user = await Admin.findById(decoded.id);
    } else if (decoded.role === 'teacher') {
      user = await Teacher.findById(decoded.id);
    } else if (decoded.role === 'student') {
      user = await Student.findById(decoded.id);
    }

    if (!user) {
      return res.status(401).json({ message: 'Unauthorized: Invalid token' });
    }

    // Attach user object to request for further use
    req.user = user;

    next();
  } catch (error) {
    return res.status(401).json({ message: 'Unauthorized: Invalid token' });
  }
};



function logger(req, res, next) {
  console.log(`[${new Date().toLocaleString()}] ${req.method} ${req.url}`);
  next();
}

module.exports = {logger,authMiddleware};