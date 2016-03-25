'use strict';

  fairMuse.controller('IndexCtrl', function($location, authenticationService) {
  	var 
  	authenticationService = authenticationService
  	this.LoggedIn = authenticationService.isLoggedIn(); 
  });
