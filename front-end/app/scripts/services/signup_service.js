angular.module('fairMuseApp').service('signupService', function($http, $location){
  var location = $location
    this.signup= function(user) {
    return $http.post("http://localhost:3000/users", user);
    };

    this.isLoggedIn = function(){
      return (localStorage.getItem('auth_token')) ? true : false;
    };

  });