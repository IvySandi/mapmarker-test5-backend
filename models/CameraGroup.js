module.exports = (sequelize, DataTypes) => {
    const CameraGroup = sequelize.define('CameraGroup', {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
    });
  
    return CameraGroup;
  };
  