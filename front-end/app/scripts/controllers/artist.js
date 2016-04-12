'use strict';

angular.module('fairMuseApp')
  .controller('ArtistCtrl', function(signupService, flash, $location, $http, $window) {
    var self = this
    var artistId;
    var location;
    location = $location

    this.artistId = localStorage.getItem('artist_id')
    this.artistName = localStorage.getItem('name')


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
