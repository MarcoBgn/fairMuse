angular.module('fairMuseApp')
.controller('ArtistSigninCtrl', function(authenticationService, flash, $location, $uibModalInstance) {
  var self = this;
  var artist, email, password, authenticationService, response, location;
  location = $location;
  self.email = "";
  self.password = "";
  
  self.cancel_it = function() {
    $uibModalInstance.close();
  }

  self.sendForm = function(email, password) {
    self.artist = {email: self.email,
                   password: self.password}
      var promise = authenticationService.artistLogin(self.artist);
      promise.then(success, error);
    };

    var success = function(response){
      localStorage.setItem('auth_token', response.data.auth_token);
      localStorage.setItem('artist_id', response.data.artist_id);
      localStorage.setItem('is_artist', response.data.is_artist);
      localStorage.setItem('name', response.data.name);
      location.path('/artistaccount')
    };

    var error = function(response) {
      flash('Wrong Login Credentials!');
    };
  });
