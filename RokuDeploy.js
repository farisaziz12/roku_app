const rokuDeploy = require("roku-deploy");
require("dotenv").config();

//deploy a .zip package of your project to a roku device
rokuDeploy
  .deploy({
    host: process.env.ROKU_IP,
    password: process.env.ROKU_PASSWORD,
    //other options if necessary
  })
  .then(
    function () {
      console.log("deployed");
    },
    function (error) {
      //it failed
      console.error(error);
    }
  );
