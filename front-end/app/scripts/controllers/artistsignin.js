angular.module('fairMuseApp')
.controller('ArtistSigninCtrl', function(authenticationService, localStorageService, flash, $location) {
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
    localStorageService.setLocalStorage(response);
    };

    var error = function(response) {
      flash('Wrong Login Credentials!');
    };
  });
