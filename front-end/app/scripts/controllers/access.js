'use strict';

angular.module('fairMuseApp')
  .controller('AccessCtrl', function(authenticationService, signupService, localStorageService, flash, $location) {
    var self = this;
    var location;
    location = $location;

    self.sendFormSignup = function() {
      self.userInfo = {email: self.email,
                       password: self.password,
                       password_confirmation: self.password_confirmation,
                       name: self.username,
                       artist: self.artist
                     };
      var promise = signupService.signup(self.userInfo);
      promise.then(success, error);
    };

    self.sendFormSignin = function() {
      self.userInfo = {email: self.email,
                       password: self.password
                       };
      var promise = authenticationService.login(self.userInfo);
      promise.then(success, error);
    };

    var success = function(response){
    localStorageService.setLocalStorage(response);
  };

    var error = function(response) {
        flash(response.data.messages);
     };

});
