angular.module('fairMuseApp')
.controller('ArtistSigninCtrl', function(authenticationService, flash, $location) {
  var self = this;
  var artist, email, password, authenticationService, response, location;
  location = $location;
  self.email = "";
  self.password = "";

  self.sendForm = function(email, password) {
    self.artist = {email: self.email,
                   password: self.password}
      var promise = authenticationService.artistLogin(self.artist);
      promise.then(success, error);
    };

    var success = function(response){
      console.log(response.data);
      localStorage.setItem('auth_token', response.data.auth_token);
      localStorage.setItem('artist_id', response.data.artist_id);
      localStorage.setItem('is_artist', response.data.is_artist);
      location.path('/artistaccount')
    };

    var error = function(response) {
      flash('Wrong Login Credentials!');
    };
  });
