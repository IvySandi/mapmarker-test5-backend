
module.exports = (sequelize, DataTypes) => {
    const Camera = sequelize.define("Camera", {
        name: { type: DataTypes.STRING, allowNull: false },
        latitude: { type: DataTypes.FLOAT, allowNull: false },
        longitude: { type: DataTypes.FLOAT, allowNull: false },
        department: { type: DataTypes.STRING, allowNull: false },
        image: { type: DataTypes.STRING, allowNull: true, },
        remarks: { type: DataTypes.STRING },
        isActive: { type: DataTypes.BOOLEAN, allowNull: false }
    });
    Camera.associate = (models) => {
        Camera.belongsToMany(models.Group, {
            through: 'CameraGroup',
            as: 'groups',
            foreignKey: 'cameraId',
        });
    };
    return Camera;
};
