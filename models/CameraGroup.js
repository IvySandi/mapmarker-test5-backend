module.exports = (sequelize, DataTypes) => {
  const CameraGroup = sequelize.define('CameraGroup', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
  },
    {
      tableName: "cameragroups",
      freezeTableName: true,
    }
  );

  return CameraGroup;
};

