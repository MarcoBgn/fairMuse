'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function(authenticationService, $location) {
  	var user, success, error, promise, authenticationService
		this.user = {}
  	user = this.user 
  	location = $location
 		this.sendForm = function() {
 		 return authenticationService.login().success(function(){
 		 	 location.path('/views/player');
 		 });
 	}
  
  });
