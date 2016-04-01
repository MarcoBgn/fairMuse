'use strict';

angular.module('fairMuseApp')
  .controller('ArtistCtrl', function(signupService, flash, $location, $http, $window) {
    var self = this
    var artistId;
    var location;
    location = $location
    
    this.artistId = localStorage.getItem('artist_id')
    this.artistName = localStorage.getItem('name')

    self.sendSignUpForm = function(email, password) {
       self.artistInfo = {name: self.name,
                    email: self.email,
                    password: self.password,
                    password_confirmation: self.password_confirmation}
       var promise = signupService.artistSignup(self.artistInfo);
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
