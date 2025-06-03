const express = require("express");
const router = express.Router();
const login = require("../middleware/usuarios.middleware");
const notificationController = require("../controllers/notifications.controller");


router.get("/",
    login.required, 
    notificationController.getNotification
);

router.put("/:idnotification",
    login.required,
    notificationController.updateNotification);

module.exports = router;