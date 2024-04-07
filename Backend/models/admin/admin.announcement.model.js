const mongoose = require("mongoose");

const adminAnnouncementSchema = new mongoose.Schema(
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

const AdminAnnouncement = mongoose.model("AdminAnnouncement", adminAnnouncementSchema);

module.exports = AdminAnnouncement;
