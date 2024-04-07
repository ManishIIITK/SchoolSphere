const express = require("express");
const app = express();
const connectDB = require("../config/db"); //
const {logger, authMiddleware} = require("../middleware/auth");

// Middleware
app.use(express.json());
app.use(logger);
// Routes
const adminRoutes = require("../routes/admin.routes");
// const studentRoutes = require('../routes/student.routes');
// const teacherRoutes = require('../routes/teacher.routes');

app.use("/admin", adminRoutes);
// app.use('/student', studentRoutes);
// app.use('/teacher', teacherRoutes);

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something went wrong!");
  next();
});

// Start server
connectDB()
  .then(() => {
    app.listen(process.env.PORT || 8000, () => {
      console.log(`Server is running at port ${process.env.PORT}`);
    });
  })
  .catch((err) => {
    console.log("Mongodb connection failed !!! ", err);
  });
