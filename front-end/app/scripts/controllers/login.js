'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function(authenticationService) {
  	var user, success, error, promise, authenticationService
		this.user = {}
  	user = this.user 
 		this.sendForm = function() {
 		 authenticationService.login(user);
 		 };
 	});
