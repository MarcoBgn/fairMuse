'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function(authenticationService) {
  	var user, email, password, authenticationService;
		this.email = "";
    this.password = "";
 		this.sendForm = function(email, password) {
      this.user = {email: this.email,
                   password: this.password}
 		   authenticationService.login(this.user);
 		 };
 	});
