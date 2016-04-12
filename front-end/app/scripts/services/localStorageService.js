'use strict';

angular.module('fairMuseApp').service('localStorageService', function($location){
  var location = $location
  this.setLocalStorage = function(response){
    localStorage.setItem('auth_token', response.data.auth_token);
    localStorage.setItem('artist_id', response.data.artist_id);
    localStorage.setItem('user_id', response.data.user_id);
    localStorage.setItem('is_artist', response.data.is_artist);
    localStorage.setItem('is_user', response.data.is_user);
    localStorage.setItem('name', response.data.name);
    if(response.data.is_user){
      location.path('/subscribe')
    }else{
      location.path('/artistaccount')};
  };
});
