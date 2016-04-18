angular.module('fairMuseApp')
.controller('ArtistAccountCtrl',function($http, flash) {
var self = this;

   self.displayBalance = function(){
           var promise = self.getBalance();
           promise.then(balanceSuccess, balanceError);
         };

     self.getBalance = function(){
       return $http.post('http://localhost:3000/api/balanceinfo', {artist_id: localStorage.getItem('artist_id')})
   };

   var balanceSuccess = function(response){
     self.balance = response.data
   };

   var balanceError = function(response) {
   flash('Wrong!');
   };

  });