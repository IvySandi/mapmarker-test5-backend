const express = require('express');
const { Camera, Group } = require('../models');
const { Op } = require('sequelize');

const router = express.Router();

router.post('/', async (req, res) => {
  try {
    const camera = await Camera.create(req.body);
    res.status(200).json(camera);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// UPDATE active status
router.post('/activetrigger', async (req, res) => {
  try {
    const { id } = req.body;


    const camera = await Camera.findByPk(id);
    if (!camera) return res.status(404).json({ error: 'Camera not found' });


    await camera.update({ isActive: !camera.isActive });

    res.status(200).json(camera);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});



router.get("/", async (req, res) => {
  try {
    const { department, name } = req.query; 
    let filter = {};

    if (department) {
      filter.department = department;
    }

    if (name) {
  
      filter.name = {
        [Op.like]: `%${name}%`, 
      };
    }

    const cameras = await Camera.findAll({ where: filter }); // Apply filter
    res.status(200).json(cameras);
  } catch (error) {
    console.error("Error fetching cameras:", error);
    res.status(500).json({ error: "Error fetching cameras" });
  }
});

router.get('/generate', async (req, res) => {
    try {
			await createData();
      res.json("success");
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });


const createData = async () => {
    const camera = await Camera.create({
      name: 'Camera 1',
      latitude: 37.7749,
      longitude: -122.4194,
      department: 'Security',
      image: 'camera1.jpg',
      remarks: 'Outdoor camera',
			isActive: true
    });
  
    const group = await Group.create({ name: 'Group A' });

    await camera.addGroup(group);
  };

module.exports = router;
