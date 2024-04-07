const AdminAnnouncement = require("../models/admin/admin.announcement.model");
const TeacherAnnouncement = require("../models/teacher/teacher.announcement.model");

// exports.createAnnouncement = async (req, res, next) => {
//   try {
//     const { announcerName, description } = req.body;

//     let announcement;
//     if (req.user.role === "admin") {
//       announcement = new AdminAnnouncement({ announcerName, description });
//     } else if (req.user.role === "teacher") {
//       announcement = new TeacherAnnouncement({ announcerName, description });
//     } else {
//       return res.status(403).json({ message: "Unauthorized" });
//     }

//     await announcement.save();

//     res
//       .status(201)
//       .json({ message: "Announcement created successfully", announcement });
//   } catch (error) {
//     next(error);
//   }
// };

// Common logic for retrieving announcements

exports.createAnnouncement = async (req, res, next) => {
  try {
    const { announcerName, description } = req.body;
    const announcement = new AdminAnnouncement({ announcerName, description });
    await announcement.save();
    res
      .status(201)
      .json({ message: "Announcement created successfully", announcement });
  } catch (error) {
    next(error);
  }
};
exports.getAnnouncements = async (req, res, next) => {
  try {
    let announcements;

    if (req.user.role === "admin") {
      announcements = await AdminAnnouncement.find();
    } else if (req.user.role === "teacher") {
      const adminAnnouncements = await AdminAnnouncement.find();
      const teacherAnnouncements = await TeacherAnnouncement.find({
        announcerName: req.user.fullName,
      });

      announcements = [...adminAnnouncements, ...teacherAnnouncements];
    } else {
      return res.status(403).json({ message: "Unauthorized" });
    }

    res.status(200).json({ announcements });
  } catch (error) {
    next(error);
  }
};
