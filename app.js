const express = require("express");
const cors = require("cors");
const app = express();
const { sequelize } = require('./models'); 
const cameraRoutes = require('./routes/cameraRoutes');
const groupRoutes = require('./routes/groupRoutes');


app.use(
    cors({
      origin: '*', 
      methods: ["GET", "POST", "PUT", "DELETE", "PATCH"],
      allowedHeaders: ["Content-Type", "Authorization"], 
    })
  );

app.use(express.json());

app.use('/api/cameras', cameraRoutes);
app.use('/api/groups', groupRoutes);


sequelize.sync({ alter: false, force: false }) 
  .then(() => {
    console.log('Database synced successfully!');
  })
  .catch((error) => {
    console.error('Error syncing database:', error);
  });




app.listen(5000, () => {
  console.log("Server running on http://localhost:5000");
});
