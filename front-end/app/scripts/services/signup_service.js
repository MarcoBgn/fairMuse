'use strict';

angular.module('fairMuseApp').service('signupService', function($http){
  this.signup= function(user) {
    return $http.post("http://localhost:3000/api/signup", user);
  };
  this.artistSignup= function(user) {
    return $http.post("http://localhost:3000/api/artistsignup", user);
  };
});
