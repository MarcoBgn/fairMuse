'use strict';

angular.module('fairMuseApp')
  .controller('SignupCtrl', function(signupService, localStorageService, flash, $location) {
    var self = this;
    var location;
    location = $location;

    self.sendForm = function() {
      self.userInfo = {email: self.email,
                       password: self.password,
                       password_confirmation: self.password_confirmation,
                       name: self.username,
                       user: self.user
                     };
      var promise = signupService.signup(self.userInfo);
      promise.then(success, error);
    };

    var success = function(response){
    localStorageService.setLocalStorage(response);
  };

    var error = function(response) {
        flash(response.data.messages);
     };

});
