const express = require('express');
const { Group, Camera } = require('../models');

const router = express.Router();


router.post('/', async (req, res) => {
    try {
      const { name, cameraIds } = req.body;

  
      // Create the group
      const group = await Group.create({ name });
  
      // If cameraIds are provided, associate them with the group
      if (cameraIds && cameraIds.length > 0) {
        const cameras = await Camera.findAll({
          where: { id: cameraIds },
        });
  
        if (cameras.length === 0) {
          return res
            .status(400)
            .json({ error: 'No valid cameras found for the provided IDs.' });
        }
  
        await group.addCameras(cameras);
      }
  
      // Fetch the group with associated cameras to return a complete response
      const result = await Group.findByPk(group.id, { include: 'cameras' });
      res.status(201).json(result);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });

// Get all Cams Group
router.get('/', async (req, res) => {
  try {
    const groups = await Group.findAll({ include: 'cameras' });
    res.json(groups);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
