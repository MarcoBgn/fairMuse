'use strict';

angular.module('fairMuseApp')
  .controller('SignupCtrl', function(signupService, flash, $location) {
    var self = this;
    var location;
    location = $location;

    self.sendForm = function() {
      self.userInfo = {email: self.email,
                       password: self.password,
                       password_confirmation: self.password_confirmation,
                       name: self.username
                     };
      if(self.user){var promise = signupService.signup(self.userInfo);
      promise.then(success_user, error_user);
    }else{
      var promise = signupService.artistSignup(self.userInfo);
     promise.then(success_artist, error_artist);
    }

    };

      var success_user = function(response){
        localStorage.setItem('auth_token', response.data.auth_token);
        localStorage.setItem('user_id', response.data.user_id);
        localStorage.setItem('is_user', response.data.is_user);
        location.path('/subscribe');
      };

      var error_user = function(response) {
        flash(response.data.messages);
     };
     var success_artist = function(response){
     localStorage.setItem('auth_token', response.data.auth_token);
     localStorage.setItem('artist_id', response.data.artist_id);
     localStorage.setItem('is_artist', response.data.is_artist);
     localStorage.setItem('name', response.data.name);

     location.path('/artistaccount')
     };

     var error_artist = function(response) {
       flash('Sign up failed!');
    };
});
