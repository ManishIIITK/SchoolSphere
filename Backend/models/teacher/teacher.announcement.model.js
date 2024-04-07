const mongoose = require("mongoose");

const teacherAnnouncementSchema = new mongoose.Schema(
  {
    announcerName: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
  },
  { timestamps: true }
);

const TeacherAnnouncement = mongoose.model("TeacherAnnouncement", teacherAnnouncementSchema);

module.exports = TeacherAnnouncement;
