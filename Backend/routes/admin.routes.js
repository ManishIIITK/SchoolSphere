const express = require("express");
const router = express.Router();
const authMiddleware = require('../middleware/auth');
const adminController = require("../controllers/admin/admin.controller");
const announcementController = require('../controllers/announcement.controller');

router.post("/login", adminController.login);
router.post("/logout", adminController.logout);
router.post("/createAdmin", adminController.createAdmin);
router.post("/createStudent", adminController.createStudent);
router.post("/createTeacher", adminController.createTeacher);

router.post('/createAnnouncement', announcementController.createAnnouncement);
router.get('/fetchAnnouncement', announcementController.getAnnouncements);


module.exports = router;
