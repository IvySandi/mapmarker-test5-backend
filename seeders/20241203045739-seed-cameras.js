'use strict';

/** @type {import('sequelize-cli').Migration} */

const mockCameras = [
  {
    name: "Camera 1",
    department: "Security",
    latitude: 1.3521,
    longitude: 103.8198,
    isActive: true,
    remarks: "Near Jurong West",
    image: "https://cdn.pixabay.com/photo/2021/07/21/02/16/architecture-6482060_1280.jpg"
  },
  {
    name: "Camera 2",
    department: "IT",
    latitude: 1.3621,
    longitude: 103.8298,
    isActive: false,
    remarks: "Near Bukit Batok",
    image : "https://cdn.pixabay.com/photo/2015/02/24/13/23/buildings-647400_1280.jpg"
  },
  {
    name: "Camera 3",
    department: "Maintenance",
    latitude: 1.3421,
    longitude: 103.8098,
    isActive: true,
    remarks: "Near Choa Chu Kang",
    image: "https://cdn.pixabay.com/photo/2017/09/04/18/00/marina-bay-of-singapore-2714866_1280.jpg"
  },
  {
    name: "Camera 4",
    department: "Security",
    latitude: 1.3321,
    longitude: 103.7998,
    isActive: false,
    remarks: "Near Jurong East",
    image: "https://cdn.pixabay.com/photo/2019/07/15/15/55/singapore-4339710_1280.jpg"
  },
];
module.exports = {
  async up(queryInterface, Sequelize) {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
    await queryInterface.bulkInsert('cameras', mockCameras, {});
  },

  async down(queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
