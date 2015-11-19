/*eslint-env node*/

//------------------------------------------------------------------------------
// node.js starter application for Bluemix
//------------------------------------------------------------------------------

// This application uses express as its web server
// for more info, see: http://expressjs.com
var express = require('express');

// cfenv provides access to your Cloud Foundry environment
// for more info, see: https://www.npmjs.com/package/cfenv
//var cfenv = require('cfenv');

// create a new express server
var app = express();

// serve the files out of ./public as our main files
app.use(express.static(__dirname + '/public'));

// get the app environment from Cloud Foundry
//var appEnv = cfenv.getAppEnv();


var appport = process.env.VCAP_APP_PORT || 3000;
var host = (process.env.VCAP_APP_HOST || 'localhost');
var server = app.listen(appport, function () {
    console.log('App listening at http://'+host+':'+appport);
});
