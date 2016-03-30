'use strict';

angular.module('fairMuseApp')
  .controller('ArtistCtrl', function(signupService, flash, $location, $http) {
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
      localStorage.setItem('artist_id', response.data.artist_id);
      localStorage.setItem('is_artist', response.data.is_artist);
      location.path('/songs')
      };

      var error = function(response) {
        flash('Sign up failed!');
     };

     self.displayBalance = function(){
           var promise = self.getBalance();
           promise.then(balanceSuccess, balanceError);
         };

     self.getBalance = function(){
       return $http.post('http://localhost:3000/api/balanceinfo', {artist_id: localStorage.getItem('artist_id')})
   };

   var balanceSuccess = function(response){
     console.log(response.data);
     self.balance = response.data
   };

   var balanceError = function(response) {
   flash('Wrong!');
   };
});
