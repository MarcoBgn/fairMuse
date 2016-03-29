'use strict';

angular.module('fairMuseApp')
  .controller('ArtistCtrl', function(signupService, flash, $location) {
    var self = this
    var location;
    location = $location

    self.sendSignUpForm = function(email, password) {
       self.artistInfo = {email: self.email,
                    password: self.password,
                    password_confirmation: self.password_confirmation}
       var promise = signupService.artistSignup(self.artistInfo);
      promise.then(success, error);
    };

      var success = function(response){
      localStorage.setItem('auth_token', response.data.auth_token);
      location.path('/songs')
      };

      var error = function(response) {

        flash('Sign up failed!');
     };
});
