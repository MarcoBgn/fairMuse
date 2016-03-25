'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function(authenticationService, $location) {
  	var user, email, password, authenticationService, response, wrongCredentials, location;
		location = $location
		this.email = "";
    this.password = "";
    this.wrongCredentials = false;
    
    this.test = function() {
      this.wrongCredentials = true;
    }
 		
 		this.sendForm = function(email, password) {
       this.user = {email: this.email,
                    password: this.password}
 		   var promise = authenticationService.login(this.user);
 		  promise.then(success, error); 
      console.log(promise.then(success, error))
    };
 		  
 		  var success = function(response){
 		  localStorage.setItem('auth_token', response.data.auth_token);
 		  location.path('/songs')
 		  };
 		  
 		  var error = function(response) {
  		  
     };
});
