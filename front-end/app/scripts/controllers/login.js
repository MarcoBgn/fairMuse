'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function(authenticationService, localStorageService, flash, $location) {
    var self = this;
    var user, email, password, authenticationService, response, location;
    location = $location;
    self.email = "";
    self.password = "";

    self.sendForm = function(email, password) {
      self.userInfo = {email: self.email,
                   password: self.password,
                   user: self.user};
      var promise = authenticationService.login(self.userInfo);
      promise.then(success, error);
    };

      var success = function(response){
      localStorageService.setLocalStorage(response);
    };

      var error = function(response) {
        flash('error', 'Wrong Login Credentials!');
     };
});
