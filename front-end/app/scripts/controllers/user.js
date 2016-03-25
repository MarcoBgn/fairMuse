'use strict';

  fairMuse.controller('UserCtrl', function ($http) {
  	$http.get('http://localhost:3000/users');
  });
