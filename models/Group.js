module.exports = (sequelize, DataTypes) => {
  const Group = sequelize.define('Group', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
    {
      tableName: "groups",
      freezeTableName: true,
    }
  );

  Group.associate = (models) => {
    Group.belongsToMany(models.Camera, {
      through: 'CameraGroup',
      as: 'cameras',
      foreignKey: 'groupId',
    });
  };

  return Group;
};
