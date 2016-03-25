'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function(authenticationService) {
  	var user, success, error, promise, authenticationService
		this.user = {}
  	user = this.user 
  	console.log(user)
 		this.sendForm = function(user) {
 		 authenticationService.login(user);
 		 };
 	});
