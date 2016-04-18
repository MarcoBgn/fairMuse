'use strict';

angular.module('fairMuseApp')
  .controller('LoginCtrl', function(authenticationService, flash, $location, $uibModalInstance) {
    var self = this;
    var user, email, password, authenticationService, response, location;
    location = $location;
    self.email = "";
    self.password = "";
    
    self.cancel_it = function() {
      $uibModalInstance.close();
    }

    self.sendForm = function(email, password) {
      self.user = {email: self.email,
                   password: self.password};
      var promise = authenticationService.login(self.user);
      promise.then(success, error);
    };

      var success = function(response){
      localStorage.setItem('auth_token', response.data.auth_token);
      localStorage.setItem('user_id', response.data.user_id);
      localStorage.setItem('is_user', response.data.is_user);
      location.path('/songs');
      };

      var error = function(response) {
        flash('error', 'Wrong Login Credentials!');
     };
});
